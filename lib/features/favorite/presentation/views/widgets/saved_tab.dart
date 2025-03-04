import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/features/favorite/presentation/views/manager/saved_cubit.dart';
import 'package:pollo/features/favorite/presentation/views/widgets/saved_item_list.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, List<Map<String, String>>>(
      builder: (context, savedItems) {
        return SingleChildScrollView(
          child: Column(
            children: [
              if (savedItems.isEmpty)
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 270.h),
                      SvgPicture.asset('assets/svgs/favorite.svg'),
                      SizedBox(height: 10.h),
                      Text(
                        'No saved items yet!',
                        style: TextStyles.font22Medium.copyWith(
                          color: AppColors.graytxt,
                        ),
                      ),
                    ],
                  ),
                )
              else
                SavedItemsList(
                  savedItems: savedItems,
                  onDelete: (int index) {
                    context.read<SavedCubit>().removeSavedItem(index);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
