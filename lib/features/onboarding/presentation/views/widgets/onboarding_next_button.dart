import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onNext;

  const NextButton({
    super.key,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onNext,
        borderRadius: BorderRadius.circular(50.r),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.mainColor,
              ),
            ),
            Container(
              width: 48.w,
              height: 48.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            Container(
              width: 36.36.w,
              height: 36.36.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.mainColor,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
