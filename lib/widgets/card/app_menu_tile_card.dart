import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppMenuTileCard extends StatelessWidget {
  final String title;
  final Color textColor;
  final IconData? icon;
  final Color iconColor;
  final VoidCallback onTap;

  const AppMenuTileCard({
    Key? key,
    required this.title,
    this.textColor = darkColor,
    this.icon,
    this.iconColor = grayColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 64.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: const Color(0xfff7f8f8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                    const SizedBox(width: 32.0),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Icon(
                  EvaIcons.arrowIosForward,
                  color: iconColor,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
