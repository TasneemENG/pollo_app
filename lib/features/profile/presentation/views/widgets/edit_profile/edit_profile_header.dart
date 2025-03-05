import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Gradient Container
        Container(
          width: double.infinity,
          height: 211.h,
          decoration:
              const BoxDecoration(gradient: AppColors.reverseMainColor),
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
          left: 145.w,
          child: Text(
            'Edit Profile',
            style: TextStyles.font22Semibold.copyWith(
              color: AppColors.background,
            ),
          ),
        ),
        // Profile Info (Extracted Widget)
        Positioned(
          top: 80.h,
          left: 145.w,
          right: 145.w,
          child: Row(children: [
            // Profile Picture Container
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: AppColors.grayBackground,
                border: Border.all(color: AppColors.borderColor, width: 1.w),
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
                  text: 'S',
                  style: TextStyles.font24Semibold,
                ),
              ),
            ),
          ]),
        ),
        Positioned(
          top: 140.h,
          right: 140.w,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(color: AppColors.borderColor, width: 1.w)
            ),
              child: SvgPicture.asset('assets/svgs/edit.svg'))
        )
      ],
    );
  }
}
