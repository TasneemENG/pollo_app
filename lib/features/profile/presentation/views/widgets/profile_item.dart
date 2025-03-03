import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onPressed;

  const ProfileItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 343.w,
        child: Column(
          children: [
            Row(
              children: [
                // Icon Button
                SvgPicture.asset(
                  iconPath,
                  width: 32.w,
                  height: 32.h, // Add height for consistency
                ),
                SizedBox(width: 10.w),
                // Title
                Text(
                  title,
                  style: TextStyles.font18Semibold.copyWith(
                    color: AppColors.bodyText,
                  ),
                ),
                const Spacer(),
                // Gradient Arrow Icon
                ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.mainColor.createShader(bounds),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18.w,
                    color: AppColors.background,
                  ),
                ),
              ],
            ),
            // Divider
            const Divider(
              color: AppColors.borderColor,
              thickness: 0.8,
            ),
          ],
        ),
      ),
    );
  }
}