import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class CategoriesTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 20.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Categories",
          style: TextStyles.categories,
        ),
      ),
    );
  }
}