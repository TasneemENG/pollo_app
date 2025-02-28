import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/add_gredient_text.dart';
import 'package:pollo/features/onboarding/presentation/widgets/onboarding_buttons.dart';
import 'package:pollo/features/onboarding/presentation/widgets/subtitle_widget.dart';

class OverlayContent extends StatelessWidget {
  final String title;
  final String subtitle;

  const OverlayContent({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
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
              crossAxisAlignment: CrossAxisAlignment.start,  // Align children to the left
              children: [
                // Ensure that the title and subtitle are aligned to the left
                TitleSubtitleSection(
                  title: title,
                  subtitle: subtitle,
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

