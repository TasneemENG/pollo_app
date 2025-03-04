import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class HelpAndSupportBody extends StatelessWidget {
  const HelpAndSupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(
          "Lorem Ipsum",
          style: TextStyles.font16Solid.copyWith(color: AppColors.mainText),
        ),
        Text(
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took aLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took aLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a",
          style: TextStyles.font16Solid.copyWith(color: AppColors.bodyText),
        ),
      ]),
    );
  }
}
