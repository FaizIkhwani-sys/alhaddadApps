import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppSecondaryBar extends StatelessWidget {
  final double toolbarHeight;
  final Widget body;
  final Color backgroundColor;
  final String? title;
  final Color titleTextColor;
  final bool centerTitle;
  final double elevation;
  final Color appBarColor;
  final Function? onPressed;
  final Widget? bottomNavigationBar;
  final bool hasBackButton;
  final Color backButtonColor;
  final List<Widget>? actions;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  const AppSecondaryBar({
    this.toolbarHeight = kToolbarHeight,
    required this.body,
    this.backgroundColor = Colors.white,
    this.title,
    this.titleTextColor = Colors.white,
    this.centerTitle = true,
    this.elevation = 0.0,
    this.appBarColor = primaryColor,
    this.onPressed,
    this.bottomNavigationBar,
    this.hasBackButton = true,
    this.backButtonColor = Colors.white,
    this.actions,
    this.bottomSheet,
    this.floatingActionButton,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endDocked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        title: Text(
          title ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: appBarColor == Colors.transparent ? 0.0 : elevation,
        centerTitle: centerTitle,
        backgroundColor: appBarColor,
        excludeHeaderSemantics: true,
        leading: hasBackButton
            ? BackButton(
                onPressed: () => onPressed ?? AppRoute.pop(context),
                color: backButtonColor,
              )
            : Container(),
        actions: actions,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
