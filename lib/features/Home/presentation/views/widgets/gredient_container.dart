import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Sample data for images and text
  final List<Map<String, dynamic>> _contentList = [
    {
      "image": Assets.doctor_home,
      "title": "Welcome to Pollo Store",
      "subtitle": "Your All-in-One Vet Store",
    },
    {
      "image": Assets.doctor_home, // Replace with your image asset
      "title": "New Arrivals",
      "subtitle": "Check out the latest products",
    },
    {
      "image": Assets.doctor_home, // Replace with your image asset
      "title": "Special Offers",
      "subtitle": "Exclusive discounts for you",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Stack(
        children: [
          // Gradient Background
          Container(
            width: 343.w,
            height: 171.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: AppColors.reverse_mainColor,
            ),
          ),

          // PageView for scrolling content
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _contentList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Stack(
                    children: [
                      // Text Content
                      Positioned(
                        left: 14.w,
                        top: 0,
                        bottom: 0,
                        child: SizedBox(
                          width: 166.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _contentList[index]["title"],
                                style: TextStyles.home_text2,
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                _contentList[index]["subtitle"],
                                style: TextStyles.home_text3,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Image
                      Positioned(
                        right: 0.w,
                        top: 0.h,
                        bottom: 0.h,
                        child: Image.asset(
                          _contentList[index]["image"],
                          fit: BoxFit.contain,
                          width: 237.w,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Dots Indicator
          Positioned(
            bottom: 10.h,
            left: 50.w,
            right: 50.w,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_contentList.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    height: index == _currentPage ? 6.h : 8.h,
                    width: index == _currentPage ? 24.w : 10.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      gradient: index == _currentPage
                          ? const LinearGradient(colors: [Colors.white, Colors.white])
                          : AppColors.container_circles,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}