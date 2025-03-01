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
        borderRadius: BorderRadius.circular(50.r), // Circular shape
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer circle with border
            Container(
              width: 50.w, // Adjust size as needed
              height: 50.h, // Adjust size as needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Circular shape
                gradient: AppColors.mainColor, // Use the mainColor gradient
              ),

            ),
            Container(
              width: 48.w, // Adjust size as needed
              height: 48.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Circular shape
                  color: Colors.white
              ),

            ),

            // Inner circle with gradient
            Container(
              width: 36.36.w, // Adjust size as needed (smaller than the outer circle)
              height: 36.36.h, // Adjust size as needed (smaller than the outer circle)
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Circular shape
                gradient: AppColors.mainColor, // Use the mainColor gradient
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios_outlined, // White arrow icon
                  color: Colors.white,
                  size: 20.sp, // Adjust size as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}