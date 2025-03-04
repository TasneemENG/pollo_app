import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/Home/data/category_item.dart';
import 'package:pollo/features/category/data/category.dart';
import 'package:pollo/features/category/presentation/views/widgets/product_grid_item.dart';
class ProductGrid extends StatelessWidget {
  final List<CategoryItem> items;

  const ProductGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: 0.9,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ProductGridItem(item: item);
      },
    );
  }
}
