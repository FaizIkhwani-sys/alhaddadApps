import 'package:flutter/material.dart';

class FastAppIcons extends StatelessWidget {
  final String image;
  final Function() onPressed;
  final String label;


  const FastAppIcons({
    Key? key,
    required this.label,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            IconButton(
              icon: Image.asset(image),
              iconSize: 50,
              onPressed: onPressed,
            ),
            SizedBox(
              height: 0.002,
            ),
            Container(
              width: 60,
              child: Text(
                label,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
