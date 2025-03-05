import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/gredient_container.dart';
import 'package:pollo/features/category/data/category.dart';
import 'package:pollo/features/category/presentation/views/widgets/product_grid.dart';

class CategoryContent extends StatelessWidget {
  final List<Category> categories;

  CategoryContent({super.key, required this.categories});
  final List<Map<String, dynamic>> categoryContentList = [
    {
      "image": Assets.pets,
      "title1": "",
      "title2": "Dogs and cats available in-store",
      "subtitle": "",
    },
    {
      "image": Assets.pets,
      "title1": "",
      "title2": "Dogs and cats available in-store",
      "subtitle": "",
    },
    {
      "image": Assets.pets,
      "title1": "",
      "title2": "Dogs and cats available in-store",
      "subtitle": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientContainer(contentList: categoryContentList),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start, // Align content to the top
            children: [
              SizedBox(height: 15.h),
              Text(
                "Available", // Your text here
                style: TextStyles.availableText,
              ),
              SizedBox(height: 5.h), // Remove or set to 0 to eliminate space
              ProductGrid(items: categories[0].items),
            ],
          ),
        ),
      ],
    );
  }
}