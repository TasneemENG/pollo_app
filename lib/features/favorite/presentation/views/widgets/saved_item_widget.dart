import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/features/favorite/presentation/views/manager/favorite_cubit.dart';

class SavedItemWidget extends StatelessWidget {
  final String title;
  final String category;
  final String iconPath;
  final VoidCallback onDelete;

  const SavedItemWidget({
    super.key,
    required this.title,
    required this.category,
    required this.iconPath,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 91.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.background,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.r),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyles.font18Medium,
                ),
                const Spacer(),
                IconButton(
                  onPressed: onDelete, // Now using callback passed from parent
                  icon: SvgPicture.asset(iconPath),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Category",
                  style: TextStyles.font16Medium.copyWith(
                    color: AppColors.bodyText,
                  ),
                ),
                SizedBox(width: 50.w),
                Text(
                  category,
                  style: TextStyles.font16Medium.copyWith(
                    color: AppColors.mainText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
