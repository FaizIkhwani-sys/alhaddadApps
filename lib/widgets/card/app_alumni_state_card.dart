import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppAlumniStateCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AppAlumniStateCard({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/alumni_politeknik_seberang_perai.png',
              height: 60.0,
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
