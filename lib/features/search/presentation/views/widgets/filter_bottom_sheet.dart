import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/widgets/drop_down_widget.dart';
import 'package:pollo/features/search/presentation/manager/filter_cubit/filter_cubit.dart';
import 'package:pollo/features/search/presentation/manager/filter_cubit/filter_state.dart';
import 'package:pollo/features/search/presentation/views/widgets/price_range_widgets.dart';
import 'package:pollo/features/search/presentation/views/widgets/search_button_widget.dart';

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
                BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                    return PriceRangeWidget(
                      priceRange: state.priceRange,
                      onChanged: (value) {
                        context.read<FilterCubit>().updatePriceRange(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),
                BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                    return CustomDropdownWidget(
                      dropdownName: "Location",
                      options: ["Location 1", "Location 2", "Location 3"],
                      selectedValue: state.selectedLocation,
                      onChanged: (value) {
                        context.read<FilterCubit>().updateLocation(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 25.h),
                BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                    return SearchButtonWidget(
                      onPressed: () {
                        _applyFilters(state.priceRange.start, state.priceRange.end, state.selectedLocation ?? "");
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
    print('Applied Filters:');
    print('Min Price: $minPrice');
    print('Max Price: $maxPrice');
    print('Location: $location');
  }
}
