import 'package:flutter/material.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/category/data/category.dart';
import 'package:pollo/features/Home/data/category_item.dart';

class CategoryNavigator {
  static void navigateToCategory(
      BuildContext context, {
        required String categoryName,
        required List<CategoryItem> items,
      }) {
    Category category = Category(
      name: categoryName,
      items: items,

    );

    context.pushNamed(
      Routes.categoryWidget,
      arguments: {
        'categories': [category], // Pass the category as a list
        'categoryName': categoryName,
        'image': categoryName,
      },
    );
  }
}