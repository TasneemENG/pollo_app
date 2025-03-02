import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

import 'product_search_bar.dart';
import 'sort_options_widget.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProductSearchBar(),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Showing results text
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Showing: ",
                      style: TextStyles.font13Medium.copyWith(
                        color: AppColors.bodyText,
                      ),
                    ),
                    TextSpan(
                      text: "1199 Results for Cats",
                      style: TextStyles.font13Medium.copyWith(
                        color: AppColors.mainText,
                      ),
                    ),
                  ],
                ),
              ),
              // Sort by dropdown
              const SortByDropdown(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Divider(
            color: AppColors.borderColor,
            thickness: 1.h,
          ),
        ),
      ],
    );
  }
}
