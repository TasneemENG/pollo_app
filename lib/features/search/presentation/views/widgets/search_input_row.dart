import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/widgets/app_search_bar.dart';
import 'filter_bottom_sheet.dart';

class SearchInputRow extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String>? onChanged;

  const SearchInputRow({
    super.key,
    required this.searchController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppSearchBar(
            searchController: searchController,
            hintText: 'Search for products...',
            onChanged: onChanged,
          ),
        ),
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.iconColor),
          ),
          child: IconButton(
            onPressed: () {
              _showFilterBottomSheet(context); // Show the bottom sheet
            },
            icon: SvgPicture.asset('assets/svgs/filter_icon.svg'),
          ),
        ),
        10.horizontalSpace,
      ],
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(),
    );
  }
}
