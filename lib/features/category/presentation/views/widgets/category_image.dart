import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryImage extends StatelessWidget {
  final String image;

  const CategoryImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 48.w,
      height: 48.h,
    );
  }
}
