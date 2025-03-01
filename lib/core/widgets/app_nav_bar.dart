import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';
import 'package:pollo/features/Home/presentation/views/home_view.dart';

// AppNavBar Widget
class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(), // Provide the Cubit
      child: Scaffold(
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return Center(
              child: _widgetOptions.elementAt(selectedIndex),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Floating Action Button Pressed');
          }, // Hardcoded image URL
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          elevation: 7,
          child: Image.asset(Assets.buttom_nav),
        ),
        bottomNavigationBar: _BottomNavigationBarWidget(),
      ),
    );
  }

  // Hardcoded page options
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const Text('Favourite Page'),
    const Text('Add Ads Page'),
    const Text('Account Page'),
  ];
}

// BottomNavigationBarWidget (Private)
class _BottomNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: BottomAppBar(
            color: Colors.white,
            surfaceTintColor: Colors.white,
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
                  _NavItem(index: 0, icon: Icons.home_filled, label: 'Home', selectedIndex: selectedIndex),
                  _NavItem(index: 1, icon: Icons.favorite, label: 'Favourite', selectedIndex: selectedIndex),
                  SizedBox(width: 48.w),
                  _NavItem(index: 2, icon: Icons.add_box, label: 'Add Ads', selectedIndex: selectedIndex),
                  _NavItem(index: 3, icon: Icons.person, label: 'Account', selectedIndex: selectedIndex),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// NavItem (Private)
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
            : const LinearGradient(
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

// BottomNavCubit (For Navigation Logic)
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updateIndex(int index) => emit(index);
}
