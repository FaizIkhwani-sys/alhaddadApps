import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    accentColor: const Color(0xFFF80823),
    errorColor: const Color(0xFFFF4646),
    primaryColor: const Color(0xFFF80823),
    primaryIconTheme: const IconThemeData(
      color: Color(0xFFF80823),
      size: 24.0,
    ),
    primarySwatch: Colors.grey,
    splashColor: Colors.white.withOpacity(0.5),
    brightness: Brightness.light,
    fontFamily: 'Manrope',
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF212121),
    accentColor: const Color(0xFFF80823),
    errorColor: const Color(0xFFFF4646),
    primaryColor: const Color(0xFFF80823),
    primaryIconTheme: const IconThemeData(
      color: Color(0xFFF80823),
      size: 24.0,
    ),
    primarySwatch: Colors.grey,
    splashColor: Colors.white.withOpacity(0.5),
    brightness: Brightness.dark,
    fontFamily: 'Manrope',
  );
}
