import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/Home/data/category_item.dart';
import 'category_widget.dart';

class CustomGridItem extends StatefulWidget {
  final String image;
  final String text;

  const CustomGridItem({super.key, required this.image, required this.text});

  @override
  State<CustomGridItem> createState() => _CustomGridItemState();
}

class _CustomGridItemState extends State<CustomGridItem> {

  final List<CategoryItem> petsItems = [
    CategoryItem(image: Assets.Cats, text: 'Cat'),
    CategoryItem(image: Assets.dogs, text: 'Dog'),
    CategoryItem(image: Assets.birds, text: 'Bird'),
  ];

  final List<CategoryItem> veterinariansItems = [
    CategoryItem(image: Assets.large_animals, text: 'Pet Animals'),
    CategoryItem(image: Assets.pet_animals, text: 'Large Animals'),
    CategoryItem(image: Assets.paultry, text: 'Poultry'),
  ];

  final List<CategoryItem> pharmaceuticalItems = [

  ];

  final List<CategoryItem> vetPharmacyItems = [

  ];

  final List<CategoryItem> chickensItems = [

  ];

  final List<CategoryItem> babyChickenItems = [

  ];

  final List<CategoryItem> eggsItems = [

  ];

  final List<CategoryItem> ducksItems = [

  ];

  final List<CategoryItem> feedingItems = [

  ];

  final List<CategoryItem> hatchingLabsItems = [

  ];

  final List<CategoryItem> farmsItems = [

  ];

  final List<CategoryItem> chemicalsItems = [

  ];

  final List<CategoryItem> slaughteringHousesItems = [

  ];

  final List<CategoryItem> transportationItems = [

  ];

  final List<CategoryItem> equipmentsAndToolsItems = [
  ];

  final List<CategoryItem> jobsItems = [

  ];

  final List<CategoryItem> othersItems = [
  ];


  final List<Map<String, dynamic>> petsContentList = const [
    {
      "image": Assets.Pets,
      "title1": "",
      "title2": "Dogs and cats available in-store",
      "subtitle": "",
    },
    {
      "image": Assets.Pets,
      "title1": "",
      "title2": "Dogs and cats available in-store",
      "subtitle": "",
    },
    {
      "image": Assets.Pets,
      "title1": "",
      "title2": "Dogs and cats available in-store",
      "subtitle": "",
    },

  ];

  final List<Map<String, dynamic>> veterinariansContentList = const [
    {
      "image": Assets.veterinarian,
      "title1": "",
      "title2": "The best veterinary doctors",
      "subtitle": "",
    },
    {
      "image": Assets.veterinarian,
      "title1": "",
      "title2": "The best veterinary doctors",
      "subtitle": "",
    },
    {
      "image": Assets.veterinarian,
      "title1": "",
      "title2": "The best veterinary doctors",
      "subtitle": "",
    },
  ];

  final List<Map<String, dynamic>> pharmaceuticalContentList = const [];
  final List<Map<String, dynamic>> vetPharmacyContentList = const [];
  final List<Map<String, dynamic>> chickensContentList = const [];
  final List<Map<String, dynamic>> babyChickenContentList = const [];
  final List<Map<String, dynamic>> eggsContentList = const [];
  final List<Map<String, dynamic>> ducksContentList = const [];
  final List<Map<String, dynamic>> feedingContentList = const [];
  final List<Map<String, dynamic>> hatchingLabsContentList = const [];
  final List<Map<String, dynamic>> farmsContentList = const [];
  final List<Map<String, dynamic>> chemicalsContentList = const [];
  final List<Map<String, dynamic>> slaughteringHousesContentList = const [];
  final List<Map<String, dynamic>> transportationContentList = const [];
  final List<Map<String, dynamic>> equipmentsAndToolsContentList = const [];
  final List<Map<String, dynamic>> jobsContentList = const [];
  final List<Map<String, dynamic>> othersContentList = const [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Determine which list to pass based on the tapped category name
        List<CategoryItem> items = [];
        List<Map<String, dynamic>> contentList = [];
        switch (widget.text) {
          case "Pets":
            items = petsItems;
            contentList = petsContentList;
            break;
          case "Veterinarians":
            items = veterinariansItems;
            contentList = veterinariansContentList;
            break;
          case "Pharmaceutical":
            items = pharmaceuticalItems;
            contentList = pharmaceuticalContentList;
            break;
          case "Vet Pharmacy":
            items = vetPharmacyItems;
            contentList = vetPharmacyContentList;
            break;
          case "Chickens":
            items = chickensItems;
            contentList = chickensContentList;
            break;
          case "Baby Chicken":
            items = babyChickenItems;
            contentList = babyChickenContentList;
            break;
          case "Eggs":
            items = eggsItems;
            contentList = eggsContentList;
            break;
          case "Ducks":
            items = ducksItems;
            contentList = ducksContentList;
            break;
          case "Feeding":
            items = feedingItems;
            contentList = feedingContentList;
            break;
          case "Hatching Labs":
            items = hatchingLabsItems;
            contentList = hatchingLabsContentList;
            break;
          case "Farms":
            items = farmsItems;
            contentList = farmsContentList;
            break;
          case "Chemicals":
            items = chemicalsItems;
            contentList = chemicalsContentList;
            break;
          case "Slaughtering Houses":
            items = slaughteringHousesItems;
            contentList = slaughteringHousesContentList;
            break;
          case "Transportation":
            items = transportationItems;
            contentList = transportationContentList;
            break;
          case "Equipments and Tools":
            items = equipmentsAndToolsItems;
            contentList = equipmentsAndToolsContentList;
            break;
          case "Jobs":
            items = jobsItems;
            contentList = jobsContentList;
            break;
          case "Others":
            items = othersItems;
            contentList = othersContentList;
            break;
          default:
            items = [];
            contentList = [];
        }

        Category category = Category(
          name: widget.text,
          items: items,
          contentList: contentList,
        );

        Navigator.pushNamed(
          context,
          Routes.categoryWidget,
          arguments: {
            'categories': [category],
            'categoryName': widget.text,
            'image': widget.image,
          },
        );
      },
      child: Container(
        width: 104.w,
        height: 95.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: const Color(0xFFD1D1D1),
            width: 1.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              width: 48.w,
              height: 48.h,
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}