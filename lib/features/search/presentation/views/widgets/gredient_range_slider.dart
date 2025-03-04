import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_colors.dart';
class GradientRangeSliderThumbShape extends RangeSliderThumbShape {
  final LinearGradient gradient;

  const GradientRangeSliderThumbShape({
    this.gradient = AppColors.mainColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20, 20); // Adjust the size as needed
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        Animation<double>? activationAnimation,
        Animation<double>? enableAnimation,
        bool? isDiscrete,
        bool? isEnabled,
        bool? isOnTop,
        TextDirection? textDirection,
        SliderThemeData? sliderTheme,
        Thumb? thumb,
        bool? isPressed,
      }) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(
          center: center,
          radius: getPreferredSize(isEnabled ?? false, isDiscrete ?? false).width / 2,
        ),
      )
      ..style = PaintingStyle.fill;

    // Draw a circle with the gradient
    canvas.drawCircle(
      center,
      getPreferredSize(isEnabled ?? false, isDiscrete ?? false).width / 2,
      paint,
    );

    // Optionally, you can add a border around the circle
    final Paint borderPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(
      center,
      getPreferredSize(isEnabled ?? false, isDiscrete ?? false).width / 2,
      borderPaint,
    );
  }
}