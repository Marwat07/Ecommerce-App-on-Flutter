import 'package:flutter/material.dart';

class TColors {
  TColors._();

  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE248);
  static const Color accent = Color(0xFFb0c7ff);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color white = Color(0xFFF3F5FF);
  static const Color black = Color(0xFF6C7570);
  

  // gradient colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end : Alignment(0.707, -0.707),
    colors:[
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),

    ],
  );

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF000000);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // border color
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // error
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // neutral shades
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);











}
