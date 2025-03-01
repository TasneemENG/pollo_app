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
  static TextStyle onboardingSubtitle = baseStyle(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.regular,
      fontFamily: 'Inter',
      height: 30 / 20,
      letterSpacing: 0,
      color: AppColors.subtitleColor);
  static TextStyle onboardingTitle = baseStyle(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: 'Inter',
      height: 36 / 24,
      letterSpacing: 0,
      color: Colors.white);
  static TextStyle Skip_button = baseStyle(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: 'Inter',
      height: 29.05 / 24,
      letterSpacing: 0,
      color: Colors.white);
  ///
  static TextStyle font24Semibold = baseStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    height: 29.05 / 24,
    letterSpacing: 0,
  );

  static TextStyle font16Medium = baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 19.36 / 16,
    letterSpacing: 0,
  );
  static TextStyle font18Medium = baseStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 21.78 / 18,
    letterSpacing: 0,
  );
  static TextStyle font14Medium = baseStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 16.94 / 14,
    letterSpacing: 0,);

  static TextStyle font16Solid = baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 19.36 / 16,
    letterSpacing: 0);

  static TextStyle font14Solid = baseStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 16.94 / 14,
    letterSpacing: 0);

  static TextStyle font20Solid = baseStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 24 / 20,
    letterSpacing: 0);

}
