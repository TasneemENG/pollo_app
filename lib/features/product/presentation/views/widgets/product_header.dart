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
    return Column(children: [
      const ProductSearchBar(),
      Padding(
        padding: EdgeInsets.only(left: 20.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Showing: ",
              style:
                  TextStyles.font13Medium.copyWith(color: AppColors.bodyText),
            ),
            Text(
              "1199 Results for Cats",
              style:
                  TextStyles.font13Medium.copyWith(color: AppColors.mainText),
            ),
            70.horizontalSpace,
            const SortByDropdown()
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Divider(
          color: AppColors.borderColor,
          thickness: 1,
        ),
      ),

    ]);
  }
}
