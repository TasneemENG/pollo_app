import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/custom_product_item_list.dart';
import 'package:pollo/features/favorite/presentation/views/manager/favorite_cubit.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<Map<String, String>>>(
      buildWhen: (previous, current) => previous != current, // Rebuild only if favorites list changes
      builder: (context, favoriteProducts) {
        return SingleChildScrollView(
          child: Column(
            children: [
              if (favoriteProducts.isEmpty)
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 270.h),
                      SvgPicture.asset('assets/svgs/favorite.svg'),
                      SizedBox(height: 10.h),
                      Text(
                        'No favorites added yet!',
                        style: TextStyles.font22Medium.copyWith(
                          color: AppColors.graytxt,
                        ),
                      ),
                    ],
                  ),
                )
              else
                CustomProductItemList(products: favoriteProducts),
            ],
          ),
        );
      },
    );
  }
}
