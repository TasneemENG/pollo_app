import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const CustomSearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.search_bar,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'What are you looking for?',
            hintStyle: TextStyles.search_text,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.iconColor,
              size: 24.sp,
            ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 16.w,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}