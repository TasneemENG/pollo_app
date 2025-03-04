import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final List<String> options;
  final String name;

  const CustomDropdownWidget({
    super.key,
    this.selectedValue,
    required this.onChanged,
    required this.options,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyles.filter_texts,
          ),
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
                  value: selectedValue,
                  onChanged: onChanged,
                  items: options.map<DropdownMenuItem<String>>((String value) {
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