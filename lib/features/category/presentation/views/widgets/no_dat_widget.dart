import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 300.h),
          Image.asset(
            Assets.emptySheep,
            width: 100.w,
            height: 100.h,
          ),
          SizedBox(height: 10.h),
          Text(
            "There are no data",
            style: TextStyles.noData,
          ),
        ],
      ),
    );
  }
}
