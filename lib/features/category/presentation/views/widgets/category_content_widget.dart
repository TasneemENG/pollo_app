import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/gredient_container.dart';
import 'package:pollo/features/category/data/category.dart';
import 'package:pollo/features/category/presentation/views/widgets/product_grid.dart';

class CategoryContent extends StatelessWidget {
  final List<Category> categories;

  const CategoryContent({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientContainer(contentList: categories[0].contentList),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 5.h, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Available", // Your text here
                style: TextStyles.available_text,
              ),
              ProductGrid(items: categories[0].items),
            ],
          ),
        ),
      ],
    );
  }
}
