import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'profile_header.dart';
import 'profile_item_list.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileHeader(
            name: 'Salma Ibrahim',
            phoneNumber: '+201234567890',
            profileInitial: 'S',
          ),
          SizedBox(height: 20.h),
          const ProfileItemList(),
        ],
      ),
    );
  }
}
