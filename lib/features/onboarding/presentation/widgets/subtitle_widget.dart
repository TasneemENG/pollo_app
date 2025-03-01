import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/add_gredient_text.dart';

import '../../../../core/resources/app_text_styles.dart';
import '../../../../core/resources/app_colors.dart'; // Import AppColors

class TitleSubtitleSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitleSection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Apply linear gradient to the title text using AppColors.mainColor
        GradientText(text: title,style:TextStyles.onboardingTitle),
        SizedBox(
          child: Text(
            subtitle,
            style: TextStyles.onboardingSubtitle,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
  }
}