
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_search_bar.dart';
import 'package:pollo/features/Home/presentation/views/widgets/categories_grid.dart';
import 'package:pollo/features/Home/presentation/views/widgets/categories_title.dart';
import 'package:pollo/core/widgets/gredient_container.dart';
import 'package:pollo/features/Home/presentation/views/widgets/logo_and_menue.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> contentList = const [
    {
      "image": Assets.doctor_home,
      "title1": "Welcome to ",
      "title2": "Pollo Store",
      "subtitle": "Your All-in-One Vet Store",
    },
    {
      "image": Assets.doctor_home,
      "title1": "New Arrivals",
      "title2": "Check out the latest products",
      "subtitle": "Shop now!",
    },
    {
      "image": Assets.doctor_home,
      "title1": "Special Offers",
      "title2": "Exclusive discounts for you",
      "subtitle": "Don't miss out!",
    },
  ];
  final List<Map<String, dynamic>> gridItems = [
    {"image": Assets.doctor_male, "text": "Veterinarians"},
    {"image": Assets.pharmacy, "text": "Pharmaceutical"},
    {"image": Assets.medicine, "text": "Vet Pharmacy"},
    {"image": Assets.sheeps, "text": "Sheep"},
    {"image": Assets.cows, "text": "Cattle"},
    {"image": Assets.milk, "text": "Milk"},
    {"image": Assets.chickens, "text": "Chickens"},
    {"image": Assets.baby_chick, "text": "Baby Chickens"},
    {"image": Assets.eggs, "text": "Eggs"},
    {"image": Assets.cats, "text": "Pets"},
    {"image": Assets.fishes, "text": "Fish"},
    {"image": Assets.ducks, "text": "Ducks"},
    {"image": Assets.farmer, "text": "Feedings"},
    {"image": Assets.noto_hatching_chech, "text": "Hatching Labs"},
    {"image": Assets.farm_fill, "text": "Farms"},
    {"image": Assets.chemecals, "text": "Chemicals"},
    {"image": Assets.Knives, "text": "Slaughtering Houses"},
    {"image": Assets.transport, "text": "Transportation"},
    {"image": Assets.tools, "text": "Equipments and Tools"},
    {"image": Assets.search, "text": "Jobs"},
    {"image": Assets.others, "text": "Others"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawerEnableOpenDragGesture: true,
      endDrawer: SizedBox(
        width: 243.w,
        child: Drawer(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  // BackdropFilter for blur effect
                  Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.side_menue,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.side_menue_shadow.withOpacity(0.2),
                          offset: const Offset(0, 0),
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    height: 155.h,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        Assets.side_menue,
                        fit: BoxFit.cover,
                        width: 150.87.w,
                        height: 71.h,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      children: [
                        _buildListTile(Assets.profile, 'Profile', onTap: () {
                          Navigator.pushNamed(context, Routes.signUpView);
                        }),
                        _buildListTile(Assets.my_ads, 'My Ads', onTap: () {
                          Navigator.pushNamed(context, Routes.signUpView);
                        }),
                        _buildListTile(Assets.contact_us, 'Contact Us', onTap: () {
                          Navigator.pushNamed(context, Routes.signUpView);
                        }),
                        _buildListTile(Assets.about, 'About', onTap: () {
                          Navigator.pushNamed(context, Routes.loginView);
                        }),
                        _buildListTile(Assets.blog, 'Blog', onTap: () {
                          Navigator.pushNamed(context, Routes.loginView);
                        }),
                        _buildListTile(Assets.settings, 'Settings', onTap: () {
                          Navigator.pushNamed(context, Routes.loginView);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              // Logout Icon with Text
              _buildLogoutTile(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LogoAndMenu(), // This widget contains the menu icon that opens the drawer
            AppSearchBar(searchController: _searchController),
            GradientContainer(contentList: contentList),
            const CategoriesTitle(),
            CategoriesGrid(gridItems: gridItems),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String image, String title, {VoidCallback? onTap}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16.w),
      child: ListTile(
        leading: Image.network(image),
        title: Text(title, style: TextStyles.side_menue_text),
        onTap: onTap ?? () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildLogoutTile() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16.w, bottom: 16.h, top: 10.h),
      child: ListTile(
        leading: Image.network(Assets.log_out),
        title: Text(
          'Log Out',
          style: TextStyles.side_menue_text
        ),
        onTap: () {
          Navigator.pushNamed(context, Routes.loginView);
        },
      ),
    );
  }
}
