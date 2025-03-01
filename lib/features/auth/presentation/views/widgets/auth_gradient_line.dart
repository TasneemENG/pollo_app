import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_colors.dart';

class GradientLine extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const GradientLine({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: AppColors.mainColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
