import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_gradient_line.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double topSpacing;
  final double horizontalPadding;
  final bool isTitleGradient;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.topSpacing = 0,
    this.horizontalPadding = 20,
    this.isTitleGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: horizontalPadding.w),
          child: Row(
            children: [
              GradientText(
                text: title,
                style: titleStyle ?? TextStyles.font24Semibold,
                isGradient: isTitleGradient,
              ),
            ],
          ),
        ),
        6.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: horizontalPadding.w),
          child: Text(
            subtitle,
            style: subtitleStyle ?? TextStyles.font16Medium,
          ),
        ),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: horizontalPadding.w),
          child: GradientLine(
            width: 40.w,
            height: 6.h,
            borderRadius: 30.r,
          ),
        ),
      ],
    );
  }
}