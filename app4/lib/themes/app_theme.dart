

import 'package:flutter/material.dart';

class AppTheme {

  


  // Brand colors
  static const primaryBlue   = Color.fromRGBO(26, 74, 132, 1);
  static const primaryAqua   = Color.fromRGBO(0, 163, 156, 1);
  static const primaryOrange = Color.fromRGBO(252, 167, 0, 1);
  // Complementary Neutral
  static const darkBlue      = Color.fromRGBO(3, 26, 55, 1);
  static const gray10        = Color.fromRGBO(243, 245, 255, 1);
  static const gray30        = Color.fromRGBO(214, 219, 245, 1);
  static const gray50        = Color.fromRGBO(159, 165, 194, 1);
  static const gray60        = Color.fromRGBO(88, 94, 124, 1);
  static const gray80        = Color.fromRGBO(87, 101, 118, 1);
  // Complementary Color
  static const red           = Color.fromRGBO(224, 14, 14, 1);
  static const green         = Color.fromRGBO(12, 134, 61, 1);
  static const blue          = Color.fromRGBO(8, 57, 116, 1);
  static const aqua          = Color.fromRGBO(0, 140, 132, 1);
  static const aqua10        = Color.fromRGBO(241, 252, 251, 1);
  static const yellow        = Color.fromRGBO(255, 187, 52, 1);
  static const lightGreen    = Color.fromRGBO(190, 241, 210, 1);
  static const lightYellow   = Color.fromRGBO(255, 221, 155, 1);
  static const lightRed      = Color.fromRGBO(255, 174, 174, 1);
  // Black and White
  static const black         = Color.fromRGBO(0, 0, 0, 1);
  static const white         = Color.fromRGBO(255, 255, 255, 1);

  static final ThemeData lightThem = ThemeData.light().copyWith(
    primaryColor: red,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: black
      ),
      color: white,
      elevation: 0
    ),
    
    
  );


}