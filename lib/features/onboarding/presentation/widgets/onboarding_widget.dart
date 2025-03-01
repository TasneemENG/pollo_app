import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';
import 'package:pollo/features/onboarding/presentation/widgets/onboarding_buttons.dart';
import 'package:pollo/features/onboarding/presentation/widgets/onboarding_image.dart';

import 'onboarding_content.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onNext;
  final int currentPage; // Add currentPage as a parameter
  final List<OnboardingModel> onboardingData; // Add onboardingData as a parameter

  const OnboardingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onNext,
    required this.currentPage, // Pass currentPage from the parent
    required this.onboardingData, // Pass onboardingData from the parent
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Background Image
        BackgroundImage(imageUrl: image),

        SizedBox(height: 30.h,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onboardingData.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 10.h,
                width: currentPage == index ? 24.w : 10.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: currentPage == index
                    ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return AppColors.mainColor.createShader(bounds);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                     // Ensure the container color is transparent for gradient to show
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFC388B3),
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                   // Inactive indicator color
                ),
              );
            }).toList(), // Reverse the order of the indicators
          ),
        ),


        // Overlay Content
        OverlayContent(
          title: title,
          subtitle: subtitle,
        ),

        // ButtonRow positioned at the bottom right

      ],
    );
  }
}