import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/features/Home/presentation/views/widgets/_home/category_nanigator.dart';
import 'package:pollo/features/category/presentation/views/widgets/custom_grid_item_container.dart';

import 'package:pollo/features/Home/data/category_item.dart';

class CustomGridItem extends StatefulWidget {
  final String image;
  final String text;

  const CustomGridItem({super.key, required this.image, required this.text});

  @override
  State<CustomGridItem> createState() => _CustomGridItemState();
}

class _CustomGridItemState extends State<CustomGridItem> {
  final List<CategoryItem> categoryItems = [
      CategoryItem(image: Assets.large_animals, text: 'Pet Animals'),
      CategoryItem(image: Assets.pet_animals, text: 'Large Animals'),
      CategoryItem(image: Assets.paultry, text: 'Poultry'),
    ];




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CategoryNavigator.navigateToCategory(
          context,
          categoryName: widget.text,
          items: categoryItems,
        );
      },
      child: CategoryGridItemContainer(
        image: widget.image,
        text: widget.text,
      ),
    );
  }
}