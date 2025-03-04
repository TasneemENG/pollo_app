import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_search_bar.dart';
// Make sure the SearchPage is imported

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: AppSearchBar(
            searchController: searchController,
            onChanged: (searchTerm) {
             context.pushNamed( Routes.searchPage);
            },
          ),
        ),
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.iconColor)),
          child: IconButton(
            onPressed: () {
              // Handle any action related to the filter button (if needed)
            },
            icon: SvgPicture.asset('assets/svgs/filter_icon.svg'),
          ),
        ),
        10.horizontalSpace,
      ],
    );
  }
}
