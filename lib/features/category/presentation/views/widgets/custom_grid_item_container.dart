
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_image.dart';
import 'category_text.dart';

class CategoryGridItemContainer extends StatelessWidget {
  final String image;
  final String text;

  const CategoryGridItemContainer({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.w,
      height: 95.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xFFD1D1D1),
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CategoryImage(image: image),
          SizedBox(height: 8.h),
          CategoryText(text: text),
        ],
      ),
    );
  }
}
