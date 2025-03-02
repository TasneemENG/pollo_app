import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Inter',
    // بيخلي التنقل بين الصفحات شكلها احسن شوية
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
