import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

enum AlertDialogType {
  success,
  warning,
  info,
}

//TODO : No need title because we can determine by the alertDialogType

class AppAlertDialog extends StatelessWidget {
  final AlertDialogType alertDialogType;
  final String title;
  final String subtitle;
  final String? description;
  final List<ActionButton> actionButtons;

  const AppAlertDialog({
    this.alertDialogType = AlertDialogType.success,
    required this.title,
    required this.subtitle,
    this.description,
    required this.actionButtons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _AlertDialogIcon(alertDialogType: alertDialogType),
            _AlertDialogContent(
              title: title,
              subtitle: subtitle,
              description: description,
              actionButtons: actionButtons,
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertDialogContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? description;
  final List<ActionButton> actionButtons;

  const _AlertDialogContent({
    required this.title,
    required this.subtitle,
    this.description,
    required this.actionButtons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shrinkWrap: true,
      children: [
        const SizedBox(height: 24.0),
        _Title(title: title),
        if (!subtitle.isNullOrWhiteSpace) ...[
          const SizedBox(height: 8.0),
          _Subtitle(subtitle: subtitle),
        ],
        const SizedBox(height: 16.0),
        if (!description.isNullOrWhiteSpace) ...[
          _Description(description: description),
          const SizedBox(height: 24.0),
        ],
        _ActionButtons(actionButtons: actionButtons),
      ],
    );
  }
}

Icon? _getIcons(AlertDialogType? alertDialogType) {
  switch (alertDialogType) {
    case AlertDialogType.success:
      return const Icon(
        EvaIcons.checkmarkCircle2,
        color: successColor,
        size: 80.0,
      );
    case AlertDialogType.warning:
      return const Icon(
        EvaIcons.closeCircle,
        color: primaryColor,
        size: 80.0,
      );
    case AlertDialogType.info:
      return const Icon(
        EvaIcons.info,
        color: primaryColor,
        size: 80.0,
      );
    default:
      return null;
  }
}

class _AlertDialogIcon extends StatelessWidget {
  final AlertDialogType alertDialogType;

  const _AlertDialogIcon({
    required this.alertDialogType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -40.0,
      left: 50.0,
      right: 50.0,
      child: Container(
        decoration: const BoxDecoration(
          color: lightColor,
          shape: BoxShape.circle,
        ),
        child: _getIcons(alertDialogType),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: darkColor,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _Subtitle extends StatelessWidget {
  final String subtitle;
  const _Subtitle({
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        color: grayColor,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _Description extends StatelessWidget {
  final String? description;

  const _Description({
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description!,
      style: const TextStyle(
        color: darkColor,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final List<ActionButton> actionButtons;

  const _ActionButtons({
    required this.actionButtons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...actionButtons.map(
          (e) => _PrimaryButton(actionButton: e),
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final ActionButton actionButton;

  const _PrimaryButton({
    required this.actionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = AppSize.widthScreen(context) / 2 - 56;
    return InkWell(
      onTap: actionButton.onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: actionButton.color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          child: Text(
            actionButton.label,
            style: const TextStyle(
              color: lightColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ActionButton {
  final String label;
  final VoidCallback onTap;
  final Color color;

  ActionButton({
    required this.label,
    required this.onTap,
    required this.color,
  });
}
