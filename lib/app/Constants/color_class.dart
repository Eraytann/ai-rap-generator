import 'package:flutter/material.dart';

class ButtonColorLibrary {
  static const Color defaultButtonColor = Color.fromRGBO(255, 255, 255, 1);
  static Color onboardingButtonColor = Colors.transparent;
  static Color homeButtonCreateButtonColor = const Color(0xFFE8455B);
  static Color elevatedButtonPromptColor =
      const Color.fromARGB(255, 41, 41, 41);
  static LinearGradient defaultGradient =
      const LinearGradient(colors: [Colors.white, Colors.white10]);
  static LinearGradient gradientButtonColor = const LinearGradient(
    colors: [
      Color(0xFFF35C70),
      Color(0xFFE54157),
      Color(0xFFDC2D96),
    ],
  );
  static const Color pink = Colors.pink;
}

class TextColorLibrary {
  static const Color homeStartLabelColor = Color(0xFFA9A9A9);
  static const Color whiteTextColor = Colors.white;
  static const Color blackTextColor = Colors.black;
  static const Color rapperNameTextColor = Colors.white;
  static const Color gridTextColor = Colors.black;
}

class LayoutColorLibrary {
  static const Color promptPageBg = Color.fromRGBO(250, 250, 250, 1);
  static const Color progressBarColor = Color(0xFFE8455B);
  static const Color whiteIcon = Colors.white;
  static const Color gridBackgroundColor = Colors.white;
  static const Color defaultRedColor = Colors.red;
  static const defaultBgColor = Colors.white;
  static const transparentColor = Colors.transparent;
}
