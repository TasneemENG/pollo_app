import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_star_rating.dart';
import 'package:pollo/features/product_details/presentation/views/widgets/owner_details_widget.dart';
import 'package:pollo/features/product_details/presentation/views/widgets/read_more_widget.dart';

class ProductDetailsInfo extends StatelessWidget {
  final String productName;
  final String price;
  final String location;
  final String date;
  final String description;
  final String ownerName;
  final String memberSince;
  final String ownerRating;
  final VoidCallback onContactPressed;
  final String locationImagePath;

  const ProductDetailsInfo({
    super.key,
    required this.productName,
    required this.price,
    required this.location,
    required this.date,
    required this.description,
    required this.ownerName,
    required this.memberSince,
    required this.ownerRating,
    required this.onContactPressed,
    required this.locationImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductHeader(productName),
          SizedBox(height: 10.h),
          _buildPriceRow(price),
          SizedBox(height: 10.h),
          _buildLocationAndDateRow(location, date),
          SizedBox(height: 20.h),
          _buildDetailsSection(description),
          SizedBox(height: 20.h),
          _buildOwnerSection(ownerName, memberSince, ownerRating, onContactPressed),
          SizedBox(height: 20.h),
          _buildLocationSection(locationImagePath),
        ],
      ),
    );
  }

  Widget _buildProductHeader(String productName) {
    return Row(
      children: [
        Text(
          productName,
          style: TextStyles.font22Medium.copyWith(
            color: AppColors.mainText,
          ),
        ),
        const Spacer(),
        const AppStarRating(rating: '3'),
      ],
    );
  }

  Widget _buildPriceRow(String price) {
    return Row(
      children: [
        Text(
          'Price: ',
          style: TextStyles.font22Medium.copyWith(
            color: AppColors.mainText,
          ),
        ),
        Text(
          price,
          style: TextStyles.font22Semibold.copyWith(
            color: AppColors.mainText,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAndDateRow(String location, String date) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.iconColor, size: 24.sp),
            SizedBox(width: 5.w),
            Text(
              location,
              style: TextStyles.font16Medium.copyWith(
                color: AppColors.graytxt,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          date,
          style: TextStyles.font16Medium.copyWith(
            color: AppColors.graytxt,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: TextStyles.font18Semibold.copyWith(
            color: AppColors.mainText,
          ),
        ),
        SizedBox(height: 10.h),
        ReadMoreWidget(
          text: description,
        ),
      ],
    );
  }

  Widget _buildOwnerSection(String ownerName, String memberSince, String ownerRating, VoidCallback onContactPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Owner',
          style: TextStyles.font18Semibold.copyWith(
            color: AppColors.mainText,
          ),
        ),
        SizedBox(height: 10.h),
        OwnerDetailsWidget(
          ownerName: ownerName,
          memberSince: memberSince,
          rating: ownerRating,
          onContactPressed: onContactPressed,
        ),
      ],
    );
  }

  Widget _buildLocationSection(String locationImagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TODO LOCATION
        Text(
          'Location',
          style: TextStyles.font18Semibold.copyWith(
            color: AppColors.mainText,
          ),
        ),
        SizedBox(height: 10.h),
        Image.asset(locationImagePath),
      ],
    );
  }
}