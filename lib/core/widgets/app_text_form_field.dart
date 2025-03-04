import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool isObscured;
  final VoidCallback togglePasswordVisibility;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  const AppTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    this.validator,
    this.onChanged,
    this.keyboardType,
    required this.isObscured,
    required this.togglePasswordVisibility,
    this.suffixIcon,
    this.labelStyle,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: labelStyle ?? TextStyles.font18Medium.copyWith(color: AppColors.mainText),
        ),
        8.verticalSpace,
        Container(
          width: 343.w,
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            gradient: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: isObscured,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle ?? TextStyles.font16Medium.copyWith(color: AppColors.graytxt),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                suffixIcon: _buildSuffixIcon(),
              ),
              validator: validator,
              cursorColor: AppColors.mainText,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (isPassword) {
      return IconButton(
        icon: Icon(
          isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.iconColor,
        ),
        onPressed: togglePasswordVisibility,
      );
    } else if (suffixIcon != null) {
      return suffixIcon;
    }
    return null;
  }
}
