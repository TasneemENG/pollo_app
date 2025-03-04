import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/app_bar.dart';
import 'package:pollo/features/Home/presentation/views/widgets/social_media_grid_widget.dart'; // Import SocialMediaGrid

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: "Contact Us"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: const SocialMediaGrid(), // Use SocialMediaGrid widget
      ),
    );
  }
}
