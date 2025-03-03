import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/features/search/presentation/views/search_page.dart'; // Make sure you have a search page

class AppSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool showClearButton;

  const AppSearchBar({
    super.key,
    required this.searchController,
    this.hintText = 'What are you looking for?',
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.showClearButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.search_bar,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: InkWell(
          onTap: () {
            print("saerck");
            // Navigate to the SearchPage when the search bar is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(
                  searchTerm: searchController.text, // Pass the current search term
                ),
              ),
            );
          },
          child: TextField(
            controller: searchController,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.search_text,
              prefixIcon: IconButton(
                icon: SvgPicture.asset('assets/svgs/search_icon.svg'),
                onPressed: () {},
                iconSize: 24,
              ),
              suffixIcon: showClearButton && searchController.text.isNotEmpty
                  ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: AppColors.iconColor,
                  size: 24.sp,
                ),
                onPressed: () {
                  searchController.clear();
                  onChanged?.call('');
                },
              )
                  : null,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 16.w,
              ),
              border: InputBorder.none,
            ),
            onSubmitted: onSubmitted,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
