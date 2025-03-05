import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/Home/data/category_item.dart';
import 'package:pollo/features/category/presentation/views/widgets/product_grid_item.dart';

class ProductGrid extends StatelessWidget {
  final List<CategoryItem> items;

  const ProductGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i += 2)
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Expanded(child: ProductGridItem(item: items[i])),
                SizedBox(width: 15.w),
                if (i + 1 < items.length)
                  Expanded(child: ProductGridItem(item: items[i + 1]))
                else
                  Expanded(child: SizedBox()),
              ],
            ),
          ),
      ],
    );
  }
}
