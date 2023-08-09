import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppSubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color btnColor;

  const AppSubmitButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.btnColor = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: AppSize.widthScreen(context),
          height: 54.0,
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppSubmitOutlineButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const AppSubmitOutlineButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: darkColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: AppSize.widthScreen(context),
        height: 54.0,
        decoration: BoxDecoration(
          border: Border.all(color: darkColor, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: darkColor,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
