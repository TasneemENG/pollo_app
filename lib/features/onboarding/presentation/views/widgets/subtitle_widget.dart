import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';

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