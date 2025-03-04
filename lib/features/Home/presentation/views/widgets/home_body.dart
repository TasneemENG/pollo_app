import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/features/Home/presentation/views/home_view.dart';
import 'package:pollo/features/favorite/presentation/views/favorite_view.dart';
import 'package:pollo/features/profile/presentation/views/profile_view.dart';
// Import DrawerContent
import 'home_content.dart'; // Import HomeContent

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
    return HomeContent(
      // Use HomeContent widget
      searchController: _searchController,
      contentList: contentList,
      gridItems: gridItems,
    );
  }
}
