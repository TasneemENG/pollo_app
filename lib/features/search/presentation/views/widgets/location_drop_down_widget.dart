import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class LocationDropdownWidget extends StatelessWidget {
  final String? selectedLocation;
  final ValueChanged<String?> onChanged;

  const LocationDropdownWidget({
    super.key,
    this.selectedLocation,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Location", style: TextStyles.filter_texts),
          SizedBox(height: 8.h),
          Center(
            child: Container(
              width: 343.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.white, width: 0.3),
                gradient: AppColors.mainColor,
              ),
              padding: EdgeInsets.all(1.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: DropdownButton<String>(
                  hint: Text("Choose", style: TextStyles.choose),
                  value: selectedLocation,
                  onChanged: onChanged,
                  items: <String>['Location 1', 'Location 2', 'Location 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  underline: Container(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.iconColor,
                    size: 24.sp,
                  ),
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
