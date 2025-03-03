import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/favorite/presentation/views/manager/favorite_cubit.dart';

import 'app_star_rating.dart';

class CustomProductItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String rating;
  final String location;
  final String timeAgo;

  const CustomProductItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.rating,
    required this.location,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.productDetailsView);
      },
      child: Container(
        width: 351.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: AppColors.borderColor, width: 0.5.w),
        ),
        child: Row(
          children: [
            Container(
              width: 139.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  bottomLeft: Radius.circular(5.r),
                ),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyles.font16Medium.copyWith(
                            color: AppColors.mainText,
                          ),
                        ),
                        BlocBuilder<FavoriteCubit, List<Map<String, dynamic>>>(
                          builder: (context, favoriteList) {
                            final isFavorite = favoriteList.any((fav) => fav['name'] == name);
                            return IconButton(
                              onPressed: () {
                                final product = {
                                  "name": name,
                                  "imagePath": imagePath,
                                  "price": price,
                                  "rating": rating,
                                  "location": location,
                                  "timeAgo": timeAgo,
                                };
                                context.read<FavoriteCubit>().toggleFavorite(product);
                              },
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : AppColors.mainText,
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Price: ',
                          style: TextStyles.font16Medium.copyWith(
                            color: AppColors.mainText,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyles.font16Solid.copyWith(
                            color: AppColors.mainText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    AppStarRating(rating: rating),
                    SizedBox(height: 8.h),
                    Text(
                      location,
                      style: TextStyles.font14Medium.copyWith(
                        color: AppColors.graytxt,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      timeAgo,
                      style: TextStyles.font12Medium.copyWith(
                        color: AppColors.graytxt,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
