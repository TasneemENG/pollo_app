import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart';

import 'profile_item.dart';

class ProfileItemList extends StatelessWidget {
  const ProfileItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItem(
          title: 'Edit Profile',
          iconPath: 'assets/svgs/edit.svg',
          onPressed: () {
            context.pushNamed(Routes.editProfileView);
          },
        ),
        SizedBox(height: 16.h),
        ProfileItem(
          title: 'Change Password',
          iconPath: 'assets/svgs/password.svg',
          onPressed: () {context.pushNamed(Routes.changePasswordView);},
        ),
        SizedBox(height: 16.h),
        ProfileItem(
            title: 'Settings',
            iconPath: 'assets/svgs/settings.svg',
            onPressed: () {}),
        SizedBox(height: 16.h),
        ProfileItem(
            title: 'Help & Support',
            iconPath: 'assets/svgs/help.svg',
            onPressed: () {context.pushNamed(Routes.helpAndSupportView);}),
        SizedBox(height: 16.h),
        ProfileItem(
          title: 'Logout',
          iconPath: 'assets/svgs/logout.svg',
          onPressed: () {},
        ),
      ],
    );
  }
}
