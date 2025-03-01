import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class AuthSocialSection extends StatelessWidget {
  final String title;
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;

  const AuthSocialSection({
    super.key,
    required this.title,
    required this.onGooglePressed,
    required this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            title,
            style: TextStyles.font14Medium.copyWith(color: AppColors.bodyText),
          ),
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(
              iconPath: 'assets/images/logo_facebook.png',
              onPressed: onFacebookPressed,
            ),
            20.horizontalSpace,
            _buildSocialButton(
              iconPath: 'assets/images/logo_google.png',
              onPressed: onGooglePressed,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({required String iconPath, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(
            iconPath,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }
}