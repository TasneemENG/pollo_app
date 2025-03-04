import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/app_button.dart';

class SearchButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const SearchButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppButton(
        onPressed: onPressed,
        text: "Search",
        width: 246.w,
        height: 48.h,
      ),
    );
  }
}
