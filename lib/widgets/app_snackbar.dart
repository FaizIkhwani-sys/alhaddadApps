import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppSnackBar {
  static Future showSnackBar(
    BuildContext context,
    String title, {
    bool? isHasAction = false,
    String? label,
    VoidCallback? onPressed,
  }) async {
    final snackBar = SnackBar(
      backgroundColor: successColor,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          const Icon(
            EvaIcons.checkmarkCircle,
            color: Colors.white,
          ),
          SizedBox(width: AppSize.spaceX16),
          Text(title),
        ],
      ),
      action: isHasAction!
          ? SnackBarAction(
              label: label ?? '',
              onPressed: onPressed ?? () {},
            )
          : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
