import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_images.dart';

import 'product_stack_image.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductStackImage(
          imagePath: Assets.rectangle_cat,
          onBackPressed: () {
            Navigator.pop(context);
          },
          onFavoritePressed: () {},
          onSharePressed: () {},
          imageCountText: '2/3',
        ),
      ],
    );
  }
}
