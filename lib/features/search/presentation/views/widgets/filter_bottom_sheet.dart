import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/search/presentation/manager/filter_cubit/filter_cubit.dart';
import 'package:pollo/features/search/presentation/views/widgets/price_range_widgets.dart';
import 'package:pollo/features/search/presentation/views/widgets/search_button_widget.dart';
import 'package:pollo/core/widgets/drop_down_widget.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilterCubit(),
      child: Container(
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
                BlocBuilder<FilterCubit, Map<String, dynamic>>(
                  builder: (context, state) {
                    final priceRange = state['priceRange'];
                    return PriceRangeWidget(
                      priceRange: priceRange,
                      onChanged: (value) {
                        context.read<FilterCubit>().updatePriceRange(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),
                BlocBuilder<FilterCubit, Map<String, dynamic>>(
                  builder: (context, state) {
                    final selectedLocation = state['selectedLocation'];
                    return CustomDropdownWidget(
                      dropdownName: "Location",
                      options: const ["Location 1", "Location 2", "Location 3"],
                      selectedValue: selectedLocation,
                      onChanged: (value) {
                        context.read<FilterCubit>().updateLocation(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 25.h),
                BlocBuilder<FilterCubit, Map<String, dynamic>>(
                  builder: (context, state) {
                    final priceRange = state['priceRange'];
                    final selectedLocation = state['selectedLocation'];
                    return SearchButtonWidget(
                      onPressed: () {
                        _applyFilters(
                          priceRange.start,
                          priceRange.end,
                          selectedLocation ?? "",
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _applyFilters(double minPrice, double maxPrice, String location) {

  }
}
