import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_colors.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const GradientText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        foreground: Paint()
          ..shader = AppColors.mainColor.createShader(
            const Rect.fromLTWH(0, 0, 100, 50), // Adjust width & height
          ),
      ),
    );
  }
}
