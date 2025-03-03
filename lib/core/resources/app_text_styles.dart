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
      fontSize: 20,
      fontWeight: FontWeightHelper.regular,
      fontFamily: 'Inter',
      height: 30 / 20,
      letterSpacing: 0,
      color: AppColors.greyColor);
  static TextStyle onboardingTitle = baseStyle(
      fontSize: 24,
      fontWeight: FontWeightHelper.bold,
      fontFamily: 'Inter',
      height: 36 / 24,
      letterSpacing: 0,
      color: Colors.white);
  static TextStyle Skip_button = baseStyle(
      fontSize: 24,
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
    fontWeight: FontWeightHelper.medium,
    height: 19.36 / 16,
    letterSpacing: 0,
  );
  static TextStyle font18Medium = baseStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.medium,
    height: 21.78 / 18,
    letterSpacing: 0,
  );
  static TextStyle font18Semibold = baseStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.semiBold,
    height: 21.78 / 18,
    letterSpacing: 0,);
  static TextStyle font14Medium = baseStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    height: 16.94 / 14,
    letterSpacing: 0,
  );
  static TextStyle font12Medium = baseStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    height: 14.5 / 12,
    letterSpacing: 0,);

  static TextStyle font12Bold = baseStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.bold,
    height: 14.5 / 12,
    letterSpacing: 0,);

  static TextStyle font13Medium = baseStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.medium,
    letterSpacing: 0,
  );
  static TextStyle font16Solid = baseStyle(
      fontSize: 16,
      fontWeight: FontWeightHelper.semiBold,
      height: 19.36 / 16,
      letterSpacing: 0);

  static TextStyle font14Solid = baseStyle(
      fontSize: 14,
      fontWeight: FontWeightHelper.semiBold,
      height: 16.94 / 14,
      letterSpacing: 0);

  static TextStyle font20Solid = baseStyle(
      fontSize: 20,
      fontWeight: FontWeightHelper.semiBold,
      height: 24 / 20,
      letterSpacing: 0);
  static TextStyle font22Medium = baseStyle(
      fontSize: 22,
      fontWeight: FontWeightHelper.medium,
      height: 25.2 / 22,
      letterSpacing: 0);


  static TextStyle font24bold = baseStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    height: 29.05 / 24,
  );
  static TextStyle font22Semibold = baseStyle(
    fontSize: 22,
    fontWeight: FontWeightHelper.semiBold,
    height: 25.2 / 22,
  );
  static TextStyle nav_item_selected = baseStyle(
      fontSize: 12, fontWeight: FontWeightHelper.regular, letterSpacing: 0);
  static TextStyle nav_item_not_selected = baseStyle(
      fontSize: 12,
      fontWeight: FontWeightHelper.regular,
      height: 14.5 / 12,
      color: AppColors.greyColor,
      fontFamily: 'Inter');
  static TextStyle search_text = baseStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.medium,
      height: 19.36 / 16,
      color: AppColors.iconColor,
      fontFamily: 'Inter');
  static TextStyle home_text1 = baseStyle(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.regular,
      height: 21.6 / 18,
      color: Colors.white,
      fontFamily: 'Itim');
  static TextStyle home_text2 = baseStyle(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.regular,
      height: 28.8 / 24,
      color: Colors.white,
      fontFamily: 'Itim');
  static TextStyle home_text3 = baseStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      height: 19.2 / 16,
      color: Colors.white,
      fontFamily: 'Itim');
  static TextStyle categories = baseStyle(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.semiBold,
      height: 29.2 / 20,
      color: Colors.black,
      fontFamily: 'Inter');

  static TextStyle categories_text = baseStyle(
      fontSize: 16,
      fontWeight:FontWeightHelper.bold ,
      height: 19.36 / 16,
      color: AppColors.mainText,
      fontFamily: 'Inter'

  );
  static TextStyle available_text = baseStyle(
      fontSize: 20,
      fontWeight:FontWeightHelper.semiBold ,
      height: 24.2 / 20,
      color: AppColors.mainText,
      fontFamily: 'Inter',
      letterSpacing: 0

  );
  static TextStyle no_data = baseStyle(
      fontSize: 22,
      fontWeight:FontWeightHelper.medium ,
      height: 26.63/ 22,
      color: AppColors.graytxt,
      fontFamily: 'Inter',
      letterSpacing: 0

  );
  static TextStyle appbar_category_style = baseStyle(
      fontSize: 22,
      fontWeight:FontWeightHelper.semiBold ,
      height: 26.63/ 22,
      color: AppColors.mainText,
      fontFamily: 'Inter',
      letterSpacing: 0

  );
}