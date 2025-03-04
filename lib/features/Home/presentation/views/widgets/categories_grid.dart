import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/Home/presentation/views/widgets/custom_grid_item.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems;

  const CategoriesGrid({super.key, required this.gridItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w), // Remove vertical padding
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 104.w / 95.h,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          return CustomGridItem(
            image: gridItems[index]["image"],
            text: gridItems[index]["text"],
          );
        },
      ),
    );
  }
}