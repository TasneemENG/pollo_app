import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (AppState previous, AppState current) {
        // Rebuild only when the state is BottomNavUpdated
        return current is BottomNavUpdated;
      },
      builder: (BuildContext context, AppState state) {
        final int currentIndex = (state is BottomNavUpdated) ? state.index : 0;
        return Stack(
          children: <Widget>[
            // BottomAppBar
            Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: BottomAppBar(
                color: AppColors.background,
                surfaceTintColor: AppColors.background,
                shape: const CircularNotchedRectangle(), // Notch for FAB
                notchMargin: 8,
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                child: Container(
                  height: 75.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _NavItem(
                          index: 0,
                          icon: Icons.home_filled,
                          label: 'Home',
                          selectedIndex: currentIndex),
                      _NavItem(
                          index: 1,
                          icon: Icons.favorite,
                          label: 'Favourite',
                          selectedIndex: currentIndex),
                      const SizedBox(width: 48), // Space for the FAB
                      _NavItem(
                          index: 2,
                          icon: Icons.add_box,
                          label: 'Add Ads',
                          selectedIndex: currentIndex),
                      _NavItem(
                          index: 3,
                          icon: Icons.person,
                          label: 'Account',
                          selectedIndex: currentIndex),
                    ],
                  ),
                ),
              ),
            ),
            // Floating Action Button (FAB)
          ],
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final int selectedIndex;

  const _NavItem({
    required this.index,
    required this.icon,
    required this.label,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => context.read<AppCubit>().updateBottomNavIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _gradientIcon(icon, isSelected),
          SizedBox(height: 4.h),
          isSelected
              ? GradientText(text: label, style: TextStyles.nav_item_selected)
              : Text(label, style: TextStyles.nav_item_not_selected),
        ],
      ),
    );
  }

  Widget _gradientIcon(IconData icon, bool isSelected) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return isSelected
            ? AppColors.mainColor.createShader(bounds)
            : const LinearGradient(
            colors: <Color>[AppColors.greyColor, AppColors.greyColor])
            .createShader(bounds);
      },
      child: Icon(icon, color: AppColors.background, size: 24.w),
    );
  }
}

