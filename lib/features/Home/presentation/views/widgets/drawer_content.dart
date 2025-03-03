import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/helpers/extensions.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // BackdropFilter for blur effect
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.side_menue,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.side_menue_shadow.withOpacity(0.2),
                    offset: Offset(0, 0),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              height: 155.h,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: Image.network(
                  Assets.side_menue,
                  fit: BoxFit.cover,
                  width: 150.87.w,
                  height: 71.h,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  _buildListTile(Assets.profile, 'Profile', onTap: () {
                    context.pushNamed(Routes.signUpView);
                  }),
                  _buildListTile(Assets.my_ads, 'My Ads', onTap: () {
                    context.pushNamed(Routes.signUpView);
                  }),
                  _buildListTile(Assets.contact_us, 'Contact Us', onTap: () {
                    context.pushNamed(Routes.signUpView);
                  }),
                  _buildListTile(Assets.about, 'About', onTap: () {
                    context.pushNamed(Routes.signUpView);
                  }),
                  _buildListTile(Assets.blog, 'Blog', onTap: () {
                    context.pushNamed(Routes.signUpView);
                  }),
                  _buildListTile(Assets.settings, 'Settings', onTap: () {
                    context.pushNamed(Routes.signUpView);
                  }),
                ],
              ),
            ),
          ),
        ),
        // Logout Icon with Text
        _buildLogoutTile(),
      ],
    );
  }

  Widget _buildListTile(String image, String title, {VoidCallback? onTap}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16.w),
      child: ListTile(
        leading: Image.network(image),
        title: Text(title, style: TextStyles.side_menue_text),
        onTap: onTap ?? () => onTap,
      ),
    );
  }

  Widget _buildLogoutTile() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16.w, bottom: 16.h, top: 10.h),
      child: ListTile(
        leading: Image.network(Assets.log_out),
        title: Text(
          'Log Out',
          style: TextStyles.side_menue_text,
        ),
        onTap: () {

        },
      ),
    );
  }
}