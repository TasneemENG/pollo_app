import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_colors.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool isGradient;

  const GradientText({
    super.key,
    required this.text,
    required this.style,
    this.isGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isGradient
          ? style.copyWith(
        foreground: Paint()
          ..shader = AppColors.mainColor.createShader(
            const Rect.fromLTWH(0, 0, 100, 50),
          ),
      )
          : style.copyWith(color: AppColors.mainText),
    );
  }
}