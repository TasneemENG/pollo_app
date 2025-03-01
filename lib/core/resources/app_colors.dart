import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color mainText = Color(0xFF0F0F0F);
  static const Color bodyText = Color(0xFF544F4F);
  static const Color iconColor = Color(0xFF7C7C7C);
  static const Color background = Color(0xFFFFFFFF);
  static const Color grayBackground = Color(0xFFECECEC);
  static const Color graytxt = Color(0xFF9B9B9B);
  static const LinearGradient mainColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [ Color(0xFF064198),Color(0xFFC20167)],
  );
  static const Color subtitleColor = Color(0xFF544F4F);
  static const LinearGradient backButtonColor = LinearGradient(
    colors: [Color(0xFFE2006E), Color(
        0xFF881268)],
  );

}
