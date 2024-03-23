import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(162, 29, 19, 1);
  static Color primaryAccent = const Color.fromRGBO(120, 14, 14, 1);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
    // seed color

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

    // scaffold color

    scaffoldBackgroundColor: AppColors.secondaryAccent,

    // appbar theme

    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.textColor,
        surfaceTintColor: Colors.transparent),

    // text theme

    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: AppColors.textColor,
        letterSpacing: 1.0,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.0,
        color: AppColors.titleColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        color: AppColors.titleColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      ),
    ),

    // input decoration theme

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.textColor),
      prefixIconColor: AppColors.textColor,
      filled: true,
      fillColor: AppColors.secondaryColor.withOpacity(0.5),
      border: InputBorder.none,
    ),

    // card theme

    cardTheme: CardTheme(
        color: AppColors.secondaryColor.withOpacity(0.5),
        shape: const RoundedRectangleBorder(),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 16.0)));
