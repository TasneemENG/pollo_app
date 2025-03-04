import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/features/Home/presentation/views/widgets/social_media_container.dart'; // Import SocialMediaContainer widget

class SocialMediaGrid extends StatelessWidget {
  const SocialMediaGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 0.8, // Adjust aspect ratio to fit content
      children: [
        // Facebook Container
        SocialMediaContainer(
          image: Image.asset(Assets.phone),
          text1: 'Facebook',
          text2: '+201010101010',
          onPressed: () {
            print('Facebook button pressed');
          },
          buttonText: 'Call Now',
        ),

        // Twitter Container
        SocialMediaContainer(
          image: Image.asset(Assets.whats_up),
          text1: 'Twitter',
          text2: '+201010101010',
          onPressed: () {
            print('Twitter button pressed');
          },
          buttonText: 'Contact',
        ),

        // Instagram Container
        SocialMediaContainer(
          image: Image.asset(Assets.email),
          text1: 'Instagram',
          text2: 'pollo@gmail.com',
          onPressed: () {
            print('Instagram button pressed');
          },
          buttonText: 'Contact',
        ),
      ],
    );
  }
}
