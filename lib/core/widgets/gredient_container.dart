import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/features/Home/presentation/manager/home_cubit/container_index_update_cubit.dart';
import 'package:pollo/features/Home/presentation/manager/home_cubit/container_index_update_state.dart';

class GradientContainer extends StatelessWidget {
  final List<Map<String, dynamic>> contentList;

  const GradientContainer({super.key, required this.contentList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContainerIndexUpdateCubit(),
      child: _GradientContainerContent(contentList: contentList),
    );
  }
}

class _GradientContainerContent extends StatelessWidget {
  final List<Map<String, dynamic>> contentList;

  const _GradientContainerContent({required this.contentList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                  itemCount: contentList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          // Content on the left with full width
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 1.w), // Padding to separate from the image
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contentList[index]["title1"],
                                    style: TextStyles.home_text1,
                                  ),
                                  Text(
                                    contentList[index]["title2"],
                                    style: TextStyles.home_text2,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    contentList[index]["subtitle"],
                                    style: TextStyles.home_text3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Image positioned at the right edge of the container
                          SizedBox(
                            width: 200.w, // Adjust the image width as needed
                            height:300.h,
                            child: Image.network(
                              contentList[index]["image"],
                              fit: BoxFit.cover,
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
          // Dots Indicator
          Positioned(
            bottom: 10.h,
            left: 50.w,
            right: 50.w,
            child: Center(
              child: BlocBuilder<ContainerIndexUpdateCubit, ContainerIndexState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(contentList.length, (index) {
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
