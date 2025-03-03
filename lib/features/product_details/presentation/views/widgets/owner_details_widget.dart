import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';
import 'package:pollo/core/widgets/app_star_rating.dart';

class OwnerDetailsWidget extends StatelessWidget {
  final String ownerName;
  final String memberSince;
  final String rating;
  final VoidCallback onContactPressed;

  const OwnerDetailsWidget({
    super.key,
    required this.ownerName,
    required this.memberSince,
    required this.rating,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildOwnerAvatar(ownerName),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOwnerNameAndContact(ownerName, onContactPressed),
              SizedBox(height: 5.h),
              _buildMemberSinceAndRating(memberSince, rating),
              SizedBox(height: 10.h),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOwnerAvatar(String ownerName) {
    return CircleAvatar(
      backgroundColor: AppColors.green,
      radius: 30.r,
      child: Text(
        ownerName.isNotEmpty ? ownerName[0] : 'S',
        style: TextStyles.font22Medium.copyWith(
          color: AppColors.background,
        ),
      ),
    );
  }

  Widget _buildOwnerNameAndContact(String ownerName, VoidCallback onContactPressed) {
    return Row(
      children: [
        Text(
          ownerName,
          style: TextStyles.font16Medium.copyWith(
            color: AppColors.mainText,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onContactPressed,
          child: Row(
            children: [
              ShaderMask(
                shaderCallback: (bounds) =>
                    AppColors.mainColor.createShader(bounds),
                child: Icon(
                  Icons.phone,
                  size: 18.w,
                  color: AppColors.background,
                ),
              ),
              SizedBox(width: 3.w),
              GradientText(
                text: 'Contact',
                style: TextStyles.font12Bold,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMemberSinceAndRating(String memberSince, String rating) {
    return Row(
      children: [
        Text(
          'Member since $memberSince',
          style: TextStyles.font12Medium.copyWith(
            color: AppColors.graytxt,
          ),
        ),
        const Spacer(),
        const AppStarRating(rating: '3'),
      ],
    );
  }
}