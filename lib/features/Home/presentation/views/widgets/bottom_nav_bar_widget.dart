import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/Home/presentation/manager/bottom_nav_cubit.dart';
import 'package:pollo/features/Home/presentation/views/widgets/nav_item.dart';

class BottomNavigationBarWidget extends StatelessWidget {
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
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: BottomAppBar(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 8,
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            child: Container(
              height: 75.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavItem(index: 0, icon: Icons.home_filled, label: 'Home', selectedIndex: selectedIndex),
                  NavItem(index: 1, icon: Icons.favorite, label: 'Favourite', selectedIndex: selectedIndex),
                  SizedBox(width: 48.w),
                  NavItem(index: 2, icon: Icons.add_box, label: 'Add Ads', selectedIndex: selectedIndex),
                  NavItem(index: 3, icon: Icons.person, label: 'Account', selectedIndex: selectedIndex),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
