import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_images.dart';
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
      "image": Assets.doctorHome,
      "title1": "Welcome to ",
      "title2": "Pollo Store",
      "subtitle": "Your All-in-One Vet Store",
    },
    {
      "image": Assets.doctorHome,
      "title1": "New Arrivals",
      "title2": "Check out the latest products",
      "subtitle": "Shop now!",
    },
    {
      "image": Assets.doctorHome,
      "title1": "Special Offers",
      "title2": "Exclusive discounts for you",
      "subtitle": "Don't miss out!",
    },
  ];
  final List<Map<String, dynamic>> gridItems = [
    {"image": Assets.doctorMale, "text": "Veterinarians"},
    {"image": Assets.pharmacy, "text": "Pharmaceutical"},
    {"image": Assets.medicine, "text": "Vet Pharmacy"},
    {"image": Assets.sheeps, "text": "Sheep"},
    {"image": Assets.cows, "text": "Cattle"},
    {"image": Assets.milk, "text": "Milk"},
    {"image": Assets.chickens, "text": "Chickens"},
    {"image": Assets.babyChick, "text": "Baby Chickens"},
    {"image": Assets.eggs, "text": "Eggs"},
    {"image": Assets.cats, "text": "Pets"},
    {"image": Assets.fishes, "text": "Fish"},
    {"image": Assets.ducks, "text": "Ducks"},
    {"image": Assets.farmer, "text": "Feedings"},
    {"image": Assets.notoHatchingChech, "text": "Hatching Labs"},
    {"image": Assets.farmFill, "text": "Farms"},
    {"image": Assets.chemicals, "text": "Chemicals"},
    {"image": Assets.knives, "text": "Slaughtering Houses"},
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
