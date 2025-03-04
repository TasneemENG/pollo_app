import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';

class DottedBorderPainter extends CustomPainter {
  final double borderRadius;

  DottedBorderPainter({this.borderRadius = 10.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.mainColor.colors.last // Use gradient color
      ..strokeWidth = 2.w
      ..style = PaintingStyle.stroke;

    const dashWidth = 20.0; // Width of each dash
    const dashSpace = 10.0; // Space between dashes

    // Draw top border
    _drawDottedLine(
      canvas,
      Offset(borderRadius, 0),
      Offset(size.width - borderRadius, 0),
      dashWidth,
      dashSpace,
      paint,
    );

    // Draw right border
    _drawDottedLine(
      canvas,
      Offset(size.width, borderRadius),
      Offset(size.width, size.height - borderRadius),
      dashWidth,
      dashSpace,
      paint,
    );

    // Draw bottom border
    _drawDottedLine(
      canvas,
      Offset(borderRadius, size.height),
      Offset(size.width - borderRadius, size.height),
      dashWidth,
      dashSpace,
      paint,
    );

    // Draw left border
    _drawDottedLine(
      canvas,
      Offset(0, borderRadius),
      Offset(0, size.height - borderRadius),
      dashWidth,
      dashSpace,
      paint,
    );

    // Draw rounded corners
    _drawRoundedCorners(canvas, size, borderRadius, paint);
  }

  // Helper method to draw dotted lines
  void _drawDottedLine(
      Canvas canvas,
      Offset start,
      Offset end,
      double dashWidth,
      double dashSpace,
      Paint paint,
      ) {
    final path = Path();
    path.moveTo(start.dx, start.dy);
    path.lineTo(end.dx, end.dy);

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double startDistance = 0;
      while (startDistance < metric.length) {
        final endDistance = startDistance + dashWidth;
        final dash = metric.extractPath(startDistance, endDistance);
        canvas.drawPath(dash, paint);
        startDistance += dashWidth + dashSpace;
      }
    }
  }

  // Helper method to draw rounded corners
  void _drawRoundedCorners(
      Canvas canvas,
      Size size,
      double borderRadius,
      Paint paint,
      ) {
    // Top-left corner
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(borderRadius, borderRadius),
        radius: borderRadius,
      ),
      -pi,
      pi / 2,
      false,
      paint,
    );

    // Top-right corner
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width - borderRadius, borderRadius),
        radius: borderRadius,
      ),
      -pi / 2,
      pi / 2,
      false,
      paint,
    );

    // Bottom-right corner
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width - borderRadius, size.height - borderRadius),
        radius: borderRadius,
      ),
      0,
      pi / 2,
      false,
      paint,
    );

    // Bottom-left corner
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(borderRadius, size.height - borderRadius),
        radius: borderRadius,
      ),
      pi / 2,
      pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}