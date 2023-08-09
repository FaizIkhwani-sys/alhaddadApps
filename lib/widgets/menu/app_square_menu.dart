import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppSquareMenu extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const AppSquareMenu({
    required this.label,
    required this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xffF5f6fc),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: secondaryColor,
            ),
            const SizedBox(height: 24.0),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18.0,
                color: darkColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
