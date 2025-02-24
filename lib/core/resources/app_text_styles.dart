import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/font_weight_helper.dart';
import 'package:pollo/core/resources/app_colors.dart';

abstract class TextStyles {
  static const String _defaultFontFamily = 'Inter';

  /// Base method
  static TextStyle baseStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color color = AppColors.mainText,
    String fontFamily = _defaultFontFamily,
    double? height,
    TextDecoration decoration = TextDecoration.none,
    double? letterSpacing,
    double? wordSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      height: height,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
    );
  }

  /// Specific styles
  static TextStyle headline = baseStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    height: 36 / 24,
    letterSpacing: 0,
  );

  static TextStyle bodyText = baseStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.regular,
    height: 30 / 20,
    letterSpacing: 0,
  );
}
