import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollo/features/category/data/category.dart';
import 'package:pollo/features/category/presentation/views/widgets/category_body.dart';

class CategoryView extends StatelessWidget {
  final List<Category> categories;
  final String categoryName;
  final String image;

  const CategoryView({super.key, required this.categories, required this.categoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CategoryBody(categories: categories, categoryName: categoryName, image: image)
    );
  }
}