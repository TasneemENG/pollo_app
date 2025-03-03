import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/widgets/app_nav_bar.dart';
import 'package:pollo/features/Home/presentation/views/home_view.dart';
import 'drawer_content.dart'; // Import DrawerContent
import 'home_content.dart'; // Import HomeContent

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController _searchController = TextEditingController();
  static final List<Widget> _widgetOptions = [
    const HomeView(),
    const Text('Favourite Page'),
    const Text('Add Ads Page'),
    const Text('Account Page'),
  ];
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
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) {
        return current is BottomNavUpdated;
      },
      builder: (context, state) {
        if (state is BottomNavUpdated) {
          return Center(child: _widgetOptions[state.index]);
        }
        return Scaffold(
          backgroundColor: Colors.white,
          endDrawerEnableOpenDragGesture: true,
          endDrawer: SizedBox(
            width: 243.w,
            child: const Drawer(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: DrawerContent(),
            ),
          ),
          body: HomeContent( // Use HomeContent widget
            searchController: _searchController,
            contentList: contentList,
            gridItems: gridItems,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
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