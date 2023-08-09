import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCircleMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const AppCircleMenu({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
