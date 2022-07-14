import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Colors.red;
  static ThemeData themeLight = ThemeData.light().copyWith(
      primaryColor: primaryColor,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        color: primaryColor,
        elevation: 0,
      ));
  static ThemeData themeDark = ThemeData.dark().copyWith(
      primaryColor: primaryColor,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        color: primaryColor,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.black
      );
}
