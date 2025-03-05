import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/Home/presentation/views/widgets/_home/custom_grid_item.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems;

  const CategoriesGrid({super.key, required this.gridItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Wrap(
        spacing: 10.w, // Horizontal spacing
        runSpacing: 10.h, // Vertical spacing
        alignment: WrapAlignment.center,
        children: gridItems.map((item) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width - 50.w) / 3, // Responsive width
            child: CustomGridItem(
              image: item["image"],
              text: item["text"],
            ),
          );
        }).toList(),
      ),
    );
  }
}
