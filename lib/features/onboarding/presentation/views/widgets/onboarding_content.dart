import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'subtitle_widget.dart';

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

