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
    return _GradientContainerContent(contentList: contentList);
  }
}

class _GradientContainerContent extends StatefulWidget {
  final List<Map<String, dynamic>> contentList;

  const _GradientContainerContent({required this.contentList});

  @override
  State<_GradientContainerContent> createState() => _GradientContainerContentState();
}

class _GradientContainerContentState extends State<_GradientContainerContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Stack(
        children: [
          // Gradient Background
          Container(
            width: 343.w,
            height: 176.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: AppColors.reverseMainColor,
            ),
          ),
          Positioned.fill(
            child: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) => current is AppContainerIndexChanged,
              builder: (context, state) {
                return PageView.builder(
                  controller: _pageController,
                  onPageChanged: (page) {
                    context.read<AppCubit>().updateContainerIndex(page);
                  },
                  itemCount: widget.contentList.length,
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
                                  Text(widget.contentList[index]["title1"], style: TextStyles.homeText1),
                                  Text(widget.contentList[index]["title2"], style: TextStyles.homeText2),
                                  SizedBox(height: 8.h),
                                  Text(widget.contentList[index]["subtitle"], style: TextStyles.homeText3),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200.w,
                            height: 300.h,
                            child: Image.asset(
                              widget.contentList[index]["image"],
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
                buildWhen: (previous, current) => current is AppContainerIndexChanged,
                builder: (context, state) {
                  int currentIndex = state is AppContainerIndexChanged ? state.index : 0;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.contentList.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        height: index == currentIndex ? 6.h : 8.h,
                        width: index == currentIndex ? 24.w : 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: index == currentIndex
                              ? const LinearGradient(colors: [Colors.white, Colors.white])
                              : AppColors.containerCircles,
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
