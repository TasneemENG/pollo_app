import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/routing/routes.dart'; // Make sure you have routes set up

class LogoAndMenu extends StatelessWidget {
  const LogoAndMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Assets.logo,
            height: 38.h,
            width: 86.w,
          ),
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: Colors.white,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: GestureDetector(
              onTap: () {

                Scaffold.of(context).openEndDrawer();
              },
              child: Center(
                child: Icon(
                  Icons.menu,
                  color: AppColors.iconColor,
                  size: 24.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}