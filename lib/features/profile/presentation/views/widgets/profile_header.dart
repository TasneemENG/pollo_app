import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 211.h,
          decoration: BoxDecoration(
            gradient: AppColors.mainColor
          ),
        ),

      ],
    );
  }
}
