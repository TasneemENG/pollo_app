import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'profile_info.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String profileInitial;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.profileInitial,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Gradient Container
        Container(
          width: double.infinity,
          height: 211.h,
          decoration: const BoxDecoration(gradient: AppColors.reverse_mainColor),
        ),

        // Back Button
        Positioned(
          top: 35.h,
          left: 15.w,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.background,
              size: 18.sp,
            ),
          ),
        ),
        // Profile Title
        Positioned(
          top: 45.h,
          left: 160.w,
          child: Text(
            'Profile',
            style: TextStyles.font22Semibold.copyWith(
              color: AppColors.background,
            ),
          ),
        ),
        // Profile Info (Extracted Widget)
        ProfileInfo(
          name: name,
          phoneNumber: phoneNumber,
          profileInitial: profileInitial,
        ),
      ],
    );
  }
}
