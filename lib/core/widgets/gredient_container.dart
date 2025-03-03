import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';


class GradientContainer extends StatelessWidget {
  final List<Map<String, dynamic>> contentList;

  const GradientContainer({super.key, required this.contentList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
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
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return PageView.builder(
                  controller: PageController(),
                  onPageChanged: (int page) {
                    context.read<AppCubit>().updateContainerIndex(page);
                  },
                  itemCount: contentList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 1.w),
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
                           SizedBox(
                            width: 200.w,
                            height:300.h,
                            child: Image.asset(
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
              child: BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  int currentIndex = 0;
                  if (state is AppContainerIndexChanged) {
                    currentIndex = state.index;
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(contentList.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        height: index == currentIndex ? 6.h : 8.h,
                        width: index == currentIndex ? 24.w : 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: index == currentIndex
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







