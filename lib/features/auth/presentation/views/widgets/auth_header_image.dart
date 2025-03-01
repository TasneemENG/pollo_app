import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';

class AuthHeaderImage extends StatelessWidget {
  final String svgAssetPath;
  final double width;
  final double height;
  final bool showPopButton;

  const AuthHeaderImage({
    super.key,
    required this.svgAssetPath,
    this.width = 404,
    this.height = 175.5,
    this.showPopButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          svgAssetPath,
          width: width.w,
          height: height.h,
          fit: BoxFit.cover,
        ),
        if (showPopButton)
          Positioned(
            top: 60.h,
            left: 20.w,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: IconButton(
                icon: SvgPicture.asset('assets/svgs/arrow-ios-right.svg'),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
      ],
    );
  }
}
