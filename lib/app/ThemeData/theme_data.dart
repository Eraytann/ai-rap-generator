import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 17),
      headlineMedium: TextStyle(fontSize: 20),
      bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      labelSmall: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    ),
    fontFamily: 'Poppins',
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconSize: MaterialStatePropertyAll(23),
      ),
    ),
    iconTheme: const IconThemeData(
      size: 23,
    ),
  );
}
