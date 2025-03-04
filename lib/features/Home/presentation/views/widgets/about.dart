import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Full-width image
              Image.asset(
                Assets.aboutImg,
                height: 368.h,
                width: double.infinity,
                fit: BoxFit.cover, // Ensure the image covers the full width
              ),

              // Row to align "About" text and back icon on the same line
              Positioned(
                top: 40.h, // Adjust this value to match your desired position
                left: 20.w,
                right: 20.w,
                child: Row(
                  children: [
                    // Back button
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Go back to the previous screen
                      },
                    ),

                    // Spacer to push the "About" text to the center
                    const Spacer(),

                    // "About" text
                    Text(
                      "About",
                      style: TextStyles.about_style,
                    ),

                    // Spacer to balance the row
                    const Spacer(),

                    // Empty container to maintain symmetry
                    SizedBox(width: 48.w), // Adjust width to match the back button's width
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          SizedBox(
            width: 343.w,
            height: 220.h,
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took aLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a",style: TextStyles.about_content_style,),
          )
        ],
      ),
    );
  }
}