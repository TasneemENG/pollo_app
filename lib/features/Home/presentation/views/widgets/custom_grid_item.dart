import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/features/Home/presentation/views/widgets/category_nanigator.dart';
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
  final Map<String, List<CategoryItem>> categoryItems = {
    "Pets": [
      CategoryItem(image: Assets.Cats, text: 'Cat'),
      CategoryItem(image: Assets.dogs, text: 'Dog'),
      CategoryItem(image: Assets.birds, text: 'Bird'),
    ],
    "Veterinarians": [
      CategoryItem(image: Assets.large_animals, text: 'Pet Animals'),
      CategoryItem(image: Assets.pet_animals, text: 'Large Animals'),
      CategoryItem(image: Assets.paultry, text: 'Poultry'),
    ],
    "Pharmaceutical": [],
    "Vet Pharmacy": [],
    "Chickens": [],
    "Baby Chicken": [],
    "Eggs": [],
    "Ducks": [],
    "Feeding": [],
    "Hatching Labs": [],
    "Farms": [],
    "Chemicals": [],
    "Slaughtering Houses": [],
    "Transportation": [],
    "Equipments and Tools": [],
    "Jobs": [],
    "Others": [],
  };

  final Map<String, List<Map<String, dynamic>>> categoryContentList = {
    "Pets": [
      {
        "image": Assets.Pets,
        "title1": "",
        "title2": "Dogs and cats available in-store",
        "subtitle": "",
      },
      {
        "image": Assets.Pets,
        "title1": "",
        "title2": "Dogs and cats available in-store",
        "subtitle": "",
      },
      {
        "image": Assets.Pets,
        "title1": "",
        "title2": "Dogs and cats available in-store",
        "subtitle": "",
      },
    ],
    "Veterinarians": [
      {
        "image": Assets.veterinarian,
        "title1": "",
        "title2": "The best veterinary doctors",
        "subtitle": "",
      },
      {
        "image": Assets.veterinarian,
        "title1": "",
        "title2": "The best veterinary doctors",
        "subtitle": "",
      },
      {
        "image": Assets.veterinarian,
        "title1": "",
        "title2": "The best veterinary doctors",
        "subtitle": "",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CategoryNavigator.navigateToCategory(
          context,
          categoryName: widget.text,
          items: categoryItems[widget.text] ?? [],
          contentList: categoryContentList[widget.text] ?? [],
        );
      },
      child: CategoryGridItemContainer(
        image: widget.image,
        text: widget.text,
      ),
    );
  }
}