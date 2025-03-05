import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Text("Search History", style: TextStyles.searchHistory),
    );
  }
}
