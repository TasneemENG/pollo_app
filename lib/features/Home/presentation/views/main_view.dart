import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/widgets/app_nav_bar.dart';
import 'package:pollo/features/Home/presentation/views/home_view.dart';
import 'package:pollo/features/Home/presentation/views/widgets/drawer_content.dart';
import 'package:pollo/features/favorite/presentation/views/favorite_view.dart';
import 'package:pollo/features/profile/presentation/views/profile_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static final List<Widget> _widgetOptions = [
    const HomeView(),
    const FavoriteView(),
    const Text('Add Ads Page', style: TextStyle(fontSize: 20)), // Placeholder
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) => current is BottomNavUpdated,
      builder: (context, state) {
        final cubit =
            context.watch<AppCubit>(); // Change from `read` to `watch`
        return Scaffold(
          backgroundColor: Colors.white,
          endDrawerEnableOpenDragGesture: true,
          endDrawer: SizedBox(
            width: 243.w,
            child: const Drawer(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: DrawerContent(),
            ),
          ),
          body: Center(child: _widgetOptions[cubit.currentIndex]),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cubit.updateBottomNavIndex(2);
            },
            shape: const CircleBorder(),
            backgroundColor: AppColors.background,
            elevation: 7,
            child: Image.asset(Assets.buttom_nav),
          ),
          bottomNavigationBar: const AppNavBar(),
        );
      },
    );
  }
}
