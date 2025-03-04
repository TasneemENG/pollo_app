import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_image.dart';
import 'onboarding_content.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int currentPage;
  final List<OnboardingModel> onboardingData;

  const OnboardingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.currentPage,
    required this.onboardingData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackgroundImage(imageUrl: image)
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(
          begin: -0.3,
          end: 0,
          duration: 600.ms,
          curve: Curves.easeOut,
        ),

        SizedBox(height: 30.h),
        _buildPageIndicators()
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(
          begin: -0.3,
          end: 0,
          duration: 600.ms,
          curve: Curves.easeOut,
        ),

        OnboardingContent(
          title: title,
          subtitle: subtitle,
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(
          begin: -0.3,
          end: 0,
          duration: 600.ms,
          curve: Curves.easeOut,
        ),
      ],
    );
  }

  // Build Page Indicators
  Widget _buildPageIndicators() {
    return Center(
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
              color: currentPage == index
                  ? Colors.transparent
                  : const Color(0xFFC388B3),
            ),
            child: currentPage == index
                ? ShaderMask(
              shaderCallback: (Rect bounds) {
                return AppColors.mainColor.createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            )
                : null,
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .scale(
              duration: 600.ms, curve: Curves.easeOut)
              .slideX( // Horizontal animation for indicators
              begin: -0.3, end: 0, duration: 600.ms, curve: Curves.easeOut);
        }),
      ),
    );
  }
}