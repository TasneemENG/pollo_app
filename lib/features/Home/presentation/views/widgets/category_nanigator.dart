import 'package:flutter/material.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/category/data/category.dart';
import 'package:pollo/features/Home/data/category_item.dart';

class CategoryNavigator {
  static void navigateToCategory(
      BuildContext context, {
        required String categoryName,
        required List<CategoryItem> items,
        required List<Map<String, dynamic>> contentList,
      }) {
    Category category = Category(
      name: categoryName,
      items: items,
      contentList: contentList,
    );

    Navigator.pushNamed(
      context,
      Routes.categoryWidget,
      arguments: {
        'categories': [category],
        'categoryName': categoryName,
        'image': categoryName,
      },
    );
  }
}