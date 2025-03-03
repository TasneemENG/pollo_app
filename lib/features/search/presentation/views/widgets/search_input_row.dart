import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/app_search_bar.dart';

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
    double minPrice = 0;
    double maxPrice = 1000;
    String selectedLocation = 'Location 1'; // Default location

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow the bottom sheet to take up more space
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Price Range Slider
                  Text(
                    'Price Range',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  RangeSlider(
                    values: RangeValues(minPrice, maxPrice),
                    min: 0,
                    max: 1000,
                    divisions: 10,
                    labels: RangeLabels(
                      '\$${minPrice.toStringAsFixed(0)}',
                      '\$${maxPrice.toStringAsFixed(0)}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        minPrice = values.start;
                        maxPrice = values.end;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Location Dropdown
                  Text(
                    'Select Location',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedLocation,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLocation = newValue!;
                      });
                    },
                    items: <String>['Location 1', 'Location 2', 'Location 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24.h),

                  // Search Button
                  Center(
                    child: AppButton(text: "Search", onPressed: () {  },height: 48.h,width:246.w,)
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _applyFilters(double minPrice, double maxPrice, String location) {
    // Implement your filter logic here
    print('Applied Filters:');
    print('Min Price: \$$minPrice');
    print('Max Price: \$$maxPrice');
    print('Location: $location');
  }
}