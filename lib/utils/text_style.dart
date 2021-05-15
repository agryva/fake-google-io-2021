

import 'dart:ui';

import 'package:fake_google_io/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class TextStyleCustom {
  static TextStyle textTimerStyle({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    Color? decorationColor,
    TextDecoration? decoration
  }) {
    if (fontWeight == null) fontWeight = FontWeight.w700;
    if (color == null) color = Color(0xff202124);

    return TextStyle(
      fontFamily: FontFamily.googleSans,
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decorationColor: decorationColor,
      decoration: decoration
    );
  }
}