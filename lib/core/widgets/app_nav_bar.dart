import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';
import 'package:pollo/features/Home/presentation/views/home_view.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        body: BlocBuilder<AppCubit, AppState>(
          buildWhen: (previous, current) {
            // Rebuild only when the state is BottomNavUpdated
            return current is BottomNavUpdated;
          },
          builder: (context, state) {
            if (state is BottomNavUpdated) {
              return Center(child: _widgetOptions[state.index]);
            }
            return Center(child: _widgetOptions[0]); // Default to HomeView
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: AppColors.background,
          elevation: 7,
          child: Image.asset(Assets.buttom_nav),
        ),
        bottomNavigationBar: const _BottomNavigationBarWidget(),
      ),
    );
  }

  static final List<Widget> _widgetOptions = [
    const HomeView(),
    const Text('Favourite Page'),
    const Text('Add Ads Page'),
    const Text('Account Page'),
  ];
}

class _BottomNavigationBarWidget extends StatelessWidget {
  const _BottomNavigationBarWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) {
        // Rebuild only when the state is BottomNavUpdated
        return current is BottomNavUpdated;
      },
      builder: (context, state) {
        final currentIndex = (state is BottomNavUpdated) ? state.index : 0;
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: BottomAppBar(
            color: AppColors.background,
            surfaceTintColor: AppColors.background,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            child: Container(
              height: 75.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  SizedBox(width: 48.w),
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
        children: [
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
      shaderCallback: (bounds) {
        return isSelected
            ? AppColors.mainColor.createShader(bounds)
            : const LinearGradient(
                    colors: [AppColors.greyColor, AppColors.greyColor])
                .createShader(bounds);
      },
      child: Icon(icon, color: AppColors.background, size: 24.w),
    );
  }
}
