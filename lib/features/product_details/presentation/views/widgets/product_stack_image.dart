import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/resources/app_images.dart';

class ProductStackImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onSharePressed;
  final String imageCountText;

  const ProductStackImage({
    super.key,
    required this.imagePath,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onSharePressed,
    required this.imageCountText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildMainImage(),
        _buildBackButton(),
        _buildActionButtons(),
        _buildImageCountIndicator(),
      ],
    );
  }

  Widget _buildMainImage() {
    return Container(
      width: double.infinity,
      height: 312.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 45.h,
      left: 20.w,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18.sp,
          color: AppColors.background,
        ),
        onPressed: onBackPressed,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Positioned(
      top: 35.h,
      right: 10.w,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 24.sp,
              color: AppColors.background,
            ),
            onPressed: onFavoritePressed,
          ),
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              size: 24.sp,
              color: AppColors.background,
            ),
            onPressed: onSharePressed,
          ),
        ],
      ),
    );
  }

  Widget _buildImageCountIndicator() {
    return Positioned(
      bottom: 15.h,
      right: 20.w,
      child: Container(
        width: 53.w,
        height: 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: AppColors.background,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.camera,
              width: 12.w,
              height: 12.h,
            ),
            SizedBox(width: 5.w),
            Text(
              imageCountText,
              style: TextStyles.font12Bold.copyWith(
                color: AppColors.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}