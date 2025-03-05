import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_button.dart';

class SocialMediaContainer extends StatelessWidget {
  final Image image;
  final String text1;
  final String text2;
  final VoidCallback onPressed;
  final String buttonText;

  const SocialMediaContainer({
    required this.image,
    required this.text1,
    required this.text2,
    required this.onPressed,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 219.h,
      width: 164.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderContactColor, width: 1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderContactColor, width: 1),
            ),
            child: ClipOval(child: image),
          ),
          SizedBox(height: 8.h),
          Text(
            text1,
            style: TextStyles.sideMenueText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            text2,
            style: TextStyles.priceStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15.h),
          // AppButton
          AppButton(
            onPressed: onPressed,
            text: buttonText,
            width: 149.w,
            height: 48.h,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
