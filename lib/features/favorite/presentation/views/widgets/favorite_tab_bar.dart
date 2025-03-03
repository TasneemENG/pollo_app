import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';

class FavoritesTabBar extends StatelessWidget {
  final TabController tabController;

  const FavoritesTabBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: TabBarGradientIndicator(
          gradientColor:
              AppColors.mainColor.colors,
          indicatorWidth: 2.w,
        ),
        labelColor: AppColors.mainColor.colors.last,
        unselectedLabelColor: AppColors.graytxt,
        labelStyle: TextStyles.font18Semibold,
        unselectedLabelStyle: TextStyles.font18Semibold,
        tabs: const [
          Tab(
            child: Text("Favorites"),
          ),
          Tab(
            child: Text("Saved Searches"),
          ),
        ],
      ),
    );
  }
}
