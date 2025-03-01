import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthHeaderImage extends StatelessWidget {
  final String svgAssetPath;
  final double width;
  final double height;

  const AuthHeaderImage({
    super.key,
    required this.svgAssetPath,
    this.width = 404,
    this.height = 175.5,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        svgAssetPath,
        width: 404.w,
        height: 175.5.h,
        fit: BoxFit.cover
    );
  }
}