import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart'; // Make sure you have this import

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Logo Placeholder (use your logo image here)
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  Assets.logo,
                  height: 38.h,
                  width: 86.w,
                ),
                Container(
                  width: 38.w, // Increase the width of the container to accommodate the IconButton
                  height: 38.h, // Increase the height to center the icon
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: Colors.white,
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Center(  // This will center the IconButton
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: AppColors.iconColor,
                      ),
                      onPressed: () {
                        // Add your action here
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Additional content
          SizedBox(height: 20),
          Text(
            'Welcome to the App!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
