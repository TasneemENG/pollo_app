// lib/features/Home/presentation/widgets/nav_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';
import 'package:pollo/features/Home/presentation/manager/bottom_nav_cubit.dart';


class NavItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final int selectedIndex;

  NavItem({
    required this.index,
    required this.icon,
    required this.label,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<BottomNavCubit>().updateIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _gradientIcon(icon, selectedIndex == index),
          SizedBox(height: 4.h),
          selectedIndex == index
              ? GradientText(
            text: label,
            style: TextStyles.nav_item_selected,
          )
              : Text(
            label,
            style: TextStyles.nav_item_not_selected,
          ),
        ],
      ),
    );
  }

  Widget _gradientIcon(IconData icon, bool isSelected) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return isSelected
            ? AppColors.mainColor.createShader(bounds)
            : LinearGradient(
          colors: [AppColors.greyColor, AppColors.greyColor],
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 24.w,
      ),
    );
  }
}
