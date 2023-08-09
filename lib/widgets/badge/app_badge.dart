import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppBadge extends StatelessWidget {
  final String status;

  const AppBadge({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.spaceX6),
      decoration: BoxDecoration(
        color: successColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Text(
        status.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
