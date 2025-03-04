import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/Home/presentation/views/widgets/contact_us/social_media_grid.dart';
class ContactUsBody extends StatelessWidget {
  const ContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: const SocialMediaGrid(), // Use SocialMediaGrid widget
    );
  }
}
