import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String subtitle;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: 358.w,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(text: title, style: TextStyles.onboardingTitle)
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),
                SizedBox(
                  child: Text(
                    subtitle,
                    style: TextStyles.onboardingSubtitle,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}