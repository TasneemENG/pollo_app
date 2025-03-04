import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.width,
    this.height,
    this.borderRadius,
    this.style,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 46.h,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.mainColor, // Ensure this is a `LinearGradient`
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        ),
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          child: Center(
            child: isLoading
                ? SizedBox(
              height: 30.h,
              width: 30.w,
              child: const CircularProgressIndicator(
                color: AppColors.background,
                strokeWidth: 2,
              ),
            )
                : Text(
              text,
              style: style ?? TextStyles.font20Solid.copyWith(color: AppColors.background),
            ),
          ),
        ),
      ),
    );
  }
}
