import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle getAppFont({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
    required double letterSpacing,
    double height = 1.2,
    required TextDecoration decoration,
  }) {
    return TextStyle(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static final repoText = getAppFont(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final desText = getAppFont(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
}
