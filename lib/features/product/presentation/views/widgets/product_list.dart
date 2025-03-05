import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';
import 'package:pollo/core/widgets/custom_product_item_list.dart';

class ProductList extends StatelessWidget {
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

  ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Featured Ads Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: Row(
            children: [
              Text(
                'Featured Ads',
                style: TextStyles.font14Medium.copyWith(
                  color: AppColors.bodyText,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Handle "View All" tap
                },
                child: Row(
                  children: [
                    GradientText(
                      text: 'View All',
                      style: TextStyles.font12Bold,
                    ),
                    SizedBox(width: 4.w),
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          AppColors.mainColor.createShader(bounds),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 12.w,
                        color: AppColors.background,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        CustomProductItemList(products: products),
      ],
    );
  }
}
