import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/widgets/app_search_bar.dart';
import 'package:pollo/features/Home/presentation/views/widgets/categories_grid.dart';
import 'package:pollo/features/Home/presentation/views/widgets/categories_title.dart';
import 'package:pollo/core/widgets/gredient_container.dart';
import 'package:pollo/features/Home/presentation/views/widgets/logo_and_menue.dart';

class HomeContent extends StatelessWidget {
  final TextEditingController searchController;
  final List<Map<String, dynamic>> contentList;
  final List<Map<String, dynamic>> gridItems;

  const HomeContent({
    super.key,
    required this.searchController,
    required this.contentList,
    required this.gridItems,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const LogoAndMenu(),
          AppSearchBar(searchController: searchController),
          GradientContainer(contentList: contentList),
          const CategoriesTitle(),
          CategoriesGrid(gridItems: gridItems),
        ],
      ),
    );
  }
}