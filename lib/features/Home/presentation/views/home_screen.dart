import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/features/Home/presentation/views/widgets/categories_grid.dart';
import 'package:pollo/features/Home/presentation/views/widgets/categories_title.dart';
import 'package:pollo/features/Home/presentation/views/widgets/gredient_container.dart';
import 'package:pollo/features/Home/presentation/views/widgets/logo_and_menue.dart';
import 'package:pollo/features/Home/presentation/views/widgets/search_bar.dart'; // Import the CustomSearchBar widget
import '../../../../core/resources/app_text_styles.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> gridItems = [
    {"image": Assets.doctor_male, "text": "Veterinarians"},
    {"image": Assets.pharmacy, "text": "Pharmaceutical"},
    {"image": Assets.medicine, "text": "Vet Pharmacy"},
    {"image": Assets.sheeps, "text": "Sheep"},
    {"image": Assets.cows, "text": "Cattle"},
    {"image": Assets.milk, "text": "Milk"},
    {"image": Assets.chickens, "text": "Chickens"},
    {"image": Assets.baby_chick, "text": "Baby Chickens"},
    {"image": Assets.eggs, "text": "Eggs"},
    {"image": Assets.cats, "text": "Pets"},
    {"image": Assets.fishes, "text": "Fish"},
    {"image": Assets.ducks, "text": "Ducks"},
    {"image": Assets.farmer, "text": "Feedings"},
    {"image": Assets.noto_hatching_chech, "text": "Hatching Labs"},
    {"image": Assets.farm_fill, "text": "Farms"},
    {"image": Assets.chemecals, "text": "Chemicals"},
    {"image": Assets.Knives, "text": "Slaughtering Houses"},
    {"image": Assets.transport, "text": "Transportation"},
    {"image": Assets.tools, "text": "Equipments and Tools"},
    {"image": Assets.search, "text": "Jobs"},
    {"image": Assets.others, "text": "Others"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoAndMenu(),
            CustomSearchBar(searchController: _searchController),
            GradientContainer(),
            CategoriesTitle(),
            CategoriesGrid(gridItems: gridItems),
          ],
        ),
      ),
    );
  }
}