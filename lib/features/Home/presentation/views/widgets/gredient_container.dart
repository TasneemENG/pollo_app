import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/features/Home/presentation/manager/home_cubit/container_index_update_cubit.dart';
import 'package:pollo/features/Home/presentation/manager/home_cubit/container_index_update_state.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContainerIndexUpdateCubit(),
      child: const _GradientContainerContent(),
    );
  }
}

class _GradientContainerContent extends StatelessWidget {
  const _GradientContainerContent();

  // Sample data for images and text
  final List<Map<String, dynamic>> _contentList = const [
    {
      "image": Assets.doctor_home,
      "title1": "Welcome to ",
      "title2": "Pollo Store",
      "subtitle": "Your All-in-One Vet Store",
    },
    {
      "image": Assets.doctor_home,
      "title1": "Welcome to ",
      "title2": "Pollo Store",
      "subtitle": "Your All-in-One Vet Store",
    },
    {
      "image": Assets.doctor_home,
      "title1": "Welcome to ",
      "title2": "Pollo Store",
      "subtitle": "Your All-in-One Vet Store",
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
          Positioned.fill(
            child: BlocBuilder<ContainerIndexUpdateCubit, ContainerIndexState>(
              builder: (context, state) {
                return PageView.builder(
                  controller: PageController(),
                  onPageChanged: (int page) {
                    context.read<ContainerIndexUpdateCubit>().updateIndex(page);
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
                                    _contentList[index]["title1"],
                                    style: TextStyles.home_text1,
                                  ),
                                  Text(
                                    _contentList[index]["title2"],
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
                          Positioned(
                            right: 0.w,
                            bottom: 0.h,
                            child: SizedBox(
                              width: 210.w,
                              child: Image.asset(
                                _contentList[index]["image"],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 50.w,
            right: 50.w,
            child: Center(
              child: BlocBuilder<ContainerIndexUpdateCubit, ContainerIndexState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_contentList.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        height: index == state.index ? 6.h : 8.h,
                        width: index == state.index ? 24.w : 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: index == state.index
                              ? const LinearGradient(colors: [Colors.white, Colors.white])
                              : AppColors.container_circles,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
