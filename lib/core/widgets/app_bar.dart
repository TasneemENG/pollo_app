import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = const Color(0xffFFD08A),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        title,
        style: TextStyles.font22Semibold,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.iconColor,
          size: 20.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}