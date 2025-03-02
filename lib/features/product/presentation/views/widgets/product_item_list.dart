import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'product_item.dart';

class ProductItemList extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'imagePath': 'assets/images/cat.png',
      'name': 'Cat',
      'price': '500 L.E',
      'rating': '3',
      'location': 'Sharkia - Zagazig',
      'timeAgo': '5 days ago',
    },
    {
      'imagePath': 'assets/images/cat.png',
      'name': 'Cat',
      'price': '500 L.E',
      'rating': '3',
      'location': 'Sharkia - Zagazig',
      'timeAgo': '5 days ago',
    },
    {
      'imagePath': 'assets/images/cat.png',
      'name': 'Cat',
      'price': '500 L.E',
      'rating': '3',
      'location': 'Sharkia - Zagazig',
      'timeAgo': '5 days ago',
    },
    {
      'imagePath': 'assets/images/cat.png',
      'name': 'Cat',
      'price': '500 L.E',
      'rating': '3',
      'location': 'Sharkia - Zagazig',
      'timeAgo': '5 days ago',
    },
    {
      'imagePath': 'assets/images/cat.png',
      'name': 'Cat',
      'price': '500 L.E',
      'rating': '3',
      'location': 'Sharkia - Zagazig',
      'timeAgo': '5 days ago',
    },
  ];
   ProductItemList({super.key});

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
              child: ProductItem(
                imagePath: product['imagePath']!,
                name: product['name']!,
                price: product['price']!,
                rating: product['rating']!,
                location: product['location']!,
                timeAgo: product['timeAgo']!,
                onFavoritePressed: () {
                  print('${product['name']} added to favorites');
                },
              ),
            );
          },
        ),
      ],
    );
  }
}