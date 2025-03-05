import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/features/search/presentation/views/widgets/gredient_range_slider.dart';
import 'package:pollo/features/search/presentation/views/widgets/gredient_slider.dart';

class PriceRangeWidget extends StatelessWidget {
  final RangeValues priceRange;
  final ValueChanged<RangeValues> onChanged;

  const PriceRangeWidget({
    super.key,
    required this.priceRange,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price Range', style: TextStyles.filterTexts),
              Text(
                '${priceRange.start.toStringAsFixed(0)} EGP - ${priceRange.end.toStringAsFixed(0)} EGP',
                style: TextStyles.priceStyle,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Center(
            child: SizedBox(
              width: 320.w,
              height: 25.h,
              child: SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 10,
                  rangeThumbShape: GradientRangeSliderThumbShape(gradient: AppColors.mainColor),
                  rangeTrackShape: GradientSlider(),
                ),
                child: RangeSlider(
                  inactiveColor: Colors.grey.withOpacity(0.5),
                  onChanged: onChanged,
                  min: 0,
                  max: 1000,
                  values: priceRange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
