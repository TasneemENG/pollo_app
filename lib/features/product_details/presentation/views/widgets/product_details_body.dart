import 'package:flutter/material.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'product_details_info.dart';
import 'product_details_stack_image.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductDetailsStackImage(
            imagePath: Assets.rectangleCat,
            onBackPressed: () {
             context.pop();
            },
            onFavoritePressed: () {},
            onSharePressed: () {},
            imageCountText: '2/3',
          ),
          ProductDetailsInfo(
            productName: 'Cat',
            price: '500 EGP',
            location: 'Sharkia - Zagazig',
            date: '2/6/2023',
            description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            ownerName: 'Salma Ibrahim',
            memberSince: 'Nov 2024',
            ownerRating: '3',
            onContactPressed: () {
            },
            locationImagePath: Assets.location,
          ),
        ],
      ),
    );
  }
}
