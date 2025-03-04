import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_bar.dart';
import 'package:pollo/core/widgets/gredient_container.dart';
import 'package:pollo/features/category/data/category.dart';
import 'package:pollo/features/category/presentation/views/widgets/category_content_widget.dart';
import 'package:pollo/features/category/presentation/views/widgets/custom_category_appbar.dart';
import 'package:pollo/features/category/presentation/views/widgets/no_dat_widget.dart';
class CategoryBody extends StatelessWidget {
  final List<Category> categories;
  final String categoryName;
  final String image;

  const CategoryBody({super.key, required this.categories, required this.categoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCategoryAppBar(title: categoryName),
        SizedBox(height: 20.h),
        if (categories[0].items.isEmpty)
          NoDataWidget()
        else
          CategoryContent(categories: categories),
      ],
    );
  }
}
