import 'package:flutter/material.dart';

class TextManrope extends StatelessWidget {
  final String text;
  final int maxLines;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;

  const TextManrope(
      {required this.text,
      this.maxLines = 1,
      this.color = Colors.black,
      this.fontSize = 15.0,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.textAlign = TextAlign.center,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Manrope',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}
