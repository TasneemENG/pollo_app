import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Stack(
        children: [
          Container(
            width: 343.w,
            height: 171.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFC20167),
                  Color(0xFF064198),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              Assets.doctor_home,
              fit: BoxFit.contain,
              width: 237.w,
            ),
          ),
          Positioned(
            left: 14.w,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: 166.w,
              height: 105.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to ",
                    style: TextStyles.home_text1,
                  ),
                  Text(
                    "Pollo Store",
                    style: TextStyles.home_text2,
                  ),
                  Text(
                    "Your All-in-One Vet Store",
                    style: TextStyles.home_text3,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 50.w,
            right: 50.w,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    height: index == 0 ? 6.h : 8.h,
                    width: index == 0 ? 24.w : 10.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: index == 0
                            ? const LinearGradient(colors: [Colors.white, Colors.white])
                            : const LinearGradient(colors: [Color(0xFFFFE6AA), Color(0xFFDBD5C6)]),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}