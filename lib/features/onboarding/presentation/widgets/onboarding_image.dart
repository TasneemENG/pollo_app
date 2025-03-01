import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundImage extends StatelessWidget {
  final String imageUrl;

  const BackgroundImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return
       Center(
            child: SizedBox(
              height: 350.h,
              width: 343.w,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain, // Ensure the entire image is visible
              ),
            ),
          );

  }
}