import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/search/presentation/views/widgets/location_drop_down_widget.dart';
import 'package:pollo/features/search/presentation/views/widgets/price_range_widgets.dart';
import 'package:pollo/features/search/presentation/views/widgets/search_button_widget.dart';


class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _priceRange = const RangeValues(0, 1000);
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              PriceRangeWidget(priceRange: _priceRange, onChanged: (value) {
                setState(() {
                  _priceRange = value;
                });
              }),
              SizedBox(height: 16.h),
              LocationDropdownWidget(
                selectedLocation: selectedLocation,
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
              SizedBox(height: 25.h),
              SearchButtonWidget(
                onPressed: () {
                  _applyFilters(_priceRange.start, _priceRange.end, selectedLocation ?? "");
                },
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  void _applyFilters(double minPrice, double maxPrice, String location) {
    print('Applied Filters:');
    print('Min Price: $minPrice');
    print('Max Price: $maxPrice');
    print('Location: $location');
  }
}
