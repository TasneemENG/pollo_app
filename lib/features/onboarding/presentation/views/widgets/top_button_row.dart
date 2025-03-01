import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';

class TopButtonsRow extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onBack;
  final VoidCallback onSkip;

  const TopButtonsRow({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onBack,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: currentPage == 0
          ? MainAxisAlignment.end  // Position "Skip" button at the right when on the first page
          : MainAxisAlignment.spaceBetween,  // Default position for other pages
      children: [
        if (currentPage > 0) // Show back button only if not on the first page
          InkWell(
            onTap: onBack,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(

                color: Colors.grey.withOpacity(0.3), // Semi-transparent background
                gradient:AppColors.backButtonColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return AppColors.mainColor.createShader(bounds);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.sp,
                  color: Colors.white, // This will not be visible, as the gradient will take over
                ),
              )
            ),
          ),
        if (currentPage < totalPages - 1 ) // Show skip button only if not on the last page
          InkWell(
            onTap: ()=>onSkip(),
            child: GradientText(
              text: 'Skip',
              style: TextStyles.Skip_button,
            ),
          ),
      ],
    );
  }
}
