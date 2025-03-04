import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/app_bar.dart';
class CustomCategoryAppBar extends StatelessWidget {
  final String title;

  const CustomCategoryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: CustomAppBar(title: title),
    );
  }
}
