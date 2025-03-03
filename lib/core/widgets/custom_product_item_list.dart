import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_product_item.dart';

class CustomProductItemList extends StatelessWidget {
  final List<Map<String, String>> products;

  const CustomProductItemList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.r),
              child: CustomProductItem(
                imagePath: product['imagePath']!,
                name: product['name']!,
                price: product['price']!,
                rating: product['rating']!,
                location: product['location']!,
                timeAgo: product['timeAgo']!,
                onFavoritePressed: () {
                 //TODO FAVORITE LOGIC
                },
              ),
            );
          },
        ),
      ],
    );
  }
}