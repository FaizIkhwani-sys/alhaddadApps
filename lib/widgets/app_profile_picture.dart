import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppProfilePicture extends StatelessWidget {
  final double radius;

  const AppProfilePicture({
    this.radius = 50.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: grayColor,
        radius: radius,
        backgroundImage: const AssetImage('assets/images/membership_try10.jpg'),
      ),
    );
  }
}
