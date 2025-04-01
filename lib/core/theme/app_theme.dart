import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0XFF5669FF);
  static const Color backgroundLight = Color(0XFFF2FEFF);
  static const Color white = Color(0XFFFFFFFF);
  static const Color black = Color(0XFF1C1C1C);
  static const Color grey = Color(0XFF7B7B7B);
  static const Color red = Color(0XFFFF5659);

  static const Color backgroundDark = Color(0XFF101127);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundLight,

    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundLight,
      elevation: 0,
      centerTitle: true,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundDark,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
