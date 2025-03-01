import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class VerificationPinPut extends StatelessWidget {
  final int pinLength;
  final void Function(String)? onCompleted;
  final TextEditingController? controller;

  const VerificationPinPut({
    super.key,
    this.pinLength = 5,
    this.onCompleted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 53.h,
      textStyle: TextStyles.font24bold.copyWith(color: AppColors.bodyText),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.grayBackground,
          width: 1.5.w,
        ),
        color: AppColors.grayBackground,
      ),
    );

    // Focused theme for the PIN input fields
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.mainColor.colors.last,
          width: 1.5.w,
        ),
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: AppColors.mainColor.colors.last,
          ),
        ],
      ),
    );

    return Pinput(
      length: pinLength,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: focusedPinTheme,
      onCompleted: onCompleted,
    );
  }
}
