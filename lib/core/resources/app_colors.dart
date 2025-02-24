import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color mainText = Color(0xFF0F0F0F);
  static const Color bodyText = Color(0xFF544F4F);
  static const Color iconColor = Color(0xFF7C7C7C);
  static const Color background = Color(0xFFFFFFFF);
  static const LinearGradient mainColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFC20167), Color(0xFF064198)],
  );
}
