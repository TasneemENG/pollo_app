import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/custom_product_item_list.dart';

class FavoriteTab extends StatelessWidget {
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
  ]; // Empty list for testing

  FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (products.isEmpty)
            Center(
              child: Column(
                children: [
                  SizedBox(height: 270.h),
                  SvgPicture.asset('assets/svgs/favorite.svg'),
                  SizedBox(height: 10.h),
                  Text(
                    'No favorites added yet!',
                    style: TextStyles.font22Medium.copyWith(color: AppColors.graytxt),
                  ),
                ],
              ),
            )
          else
            CustomProductItemList(products: products),
        ],
      ),
    );
  }
}