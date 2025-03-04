import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String profileInitial;

  const ProfileInfo({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.profileInitial,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100.h,
      left: 20.w,
      child: Row(
        children: [
          // Profile Picture Container
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.grayBackground,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.greyColor,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: GradientText(
                text: profileInitial,
                style: TextStyles.font24Semibold,
              ),
            ),
          ),

          // Spacer
          SizedBox(width: 5.w),

          // User Info Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyles.font22Medium.copyWith(
                  color: AppColors.background,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                phoneNumber,
                style: TextStyles.font16Medium.copyWith(
                  color: AppColors.background,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
