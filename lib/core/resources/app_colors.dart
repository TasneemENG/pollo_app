import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color mainText = Color(0xFF0F0F0F);
  static const Color bodyText = Color(0xFF544F4F);
  static const Color iconColor = Color(0xFF7C7C7C);
  static const Color background = Color(0xFFFFFFFF);
  static const Color grayBackground = Color(0xFFECECEC);
  static const Color graytxt = Color(0xFF9B9B9B);
  static const Color green = Color(0xFF06833E);
  static const LinearGradient mainColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [ Color(0xFF064198),Color(0xFFC20167)],
  );
  static const LinearGradient reverseMainColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [  Color.fromRGBO(194, 1, 103, 0.7),
      Color.fromRGBO(6, 65, 152, 0.7),],
  );
  static const LinearGradient containerCircles = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [ Color(0xFFFFE6AA), Color(0xFFDBD5C6),],
  );
  static  LinearGradient sideMenue = const LinearGradient(
    begin: Alignment.centerLeft, // 90deg direction
    end: Alignment.centerRight,
    colors: [
      Color(0x4F064198),
      Color(0x4FC20167),
    ],
  );
  static const Color greyColor = Color(0xFF544F4F);
  static const Color sideMenueShadow = Color(0x40A444A6);
  static const LinearGradient backButtonColor = LinearGradient(
    colors: [Color(0xFFE2006E), Color(
        0xFF881268)],
  );
  static const Color borderColor = Color(0xFFDBD5D5);
  static const Color borderContactColor = Color(0xFFC5C5C5);
  static const Color searchBar = Color(0xFFECECEC);
  static const Color categoryContainer= Color(0xFFF1F1F1);
}
