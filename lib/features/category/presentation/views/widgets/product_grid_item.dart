import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/Home/data/category_item.dart';
class ProductGridItem extends StatelessWidget {
  final CategoryItem item;

  const ProductGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.productView);
      },
      child: Stack(
        children: [
          Container(
            width: 164.w,
            height: 190.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: AppColors.mainColor,
            ),
          ),
          Positioned(
            top: 1.h,
            left: 1.w,
            child: Container(
              width: 162.w,
              height: 184.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.category_container,
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            left: 10.w,
            right: 10.w,
            child: Container(
              height: 170.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 133.w,
                    height: 133.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      gradient: AppColors.mainColor,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.asset(
                          item.image,
                          width: 132.w,
                          height: 132.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    item.text,
                    textAlign: TextAlign.center,
                    style: TextStyles.categories_text,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
