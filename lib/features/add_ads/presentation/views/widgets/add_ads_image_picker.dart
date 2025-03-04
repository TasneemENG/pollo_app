import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';
import 'package:pollo/features/add_ads/presentation/manager/image_picker/image_picker_cubit.dart';
import 'package:pollo/features/add_ads/presentation/views/widgets/dotted_border_painter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdsImagePicker extends StatelessWidget {
  final ValueChanged<File?> onImageSelected;

  const AddAdsImagePicker({
    super.key,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, File?>(
      buildWhen: (previous, current) => previous?.path != current?.path,
      builder: (context, imageFile) {
        return GestureDetector(
          onTap: () => _pickImage(context),
          child: Container(
            width: 343.w,
            height: 204.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: CustomPaint(
              painter: DottedBorderPainter(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.background,
                ),
                child: imageFile == null
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svgs/upload.svg'),
                    8.verticalSpace,
                    Container(
                      width: 129.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: AppColors.reverseMainColor,
                      ),
                      padding: EdgeInsets.all(1.w),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.borderColor,
                        ),
                        child: Center(
                          child: GradientText(
                            text: 'Add Image',
                            style: TextStyles.font16Solid.copyWith(
                                color: AppColors.mainColor.colors.first),
                          ),
                        ),
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      '5MB maximum file size accepted in\n the following formats: .jpg, .png',
                      textAlign: TextAlign.center,
                      style: TextStyles.font16Medium
                          .copyWith(color: AppColors.bodyText),
                    ),
                  ],
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                    imageFile,
                    width: 343.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final currentContext = context; // Store the context in a local variable

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final fileSize = await file.length();

        if (fileSize <= 5 * 1024 * 1024) {
          if (currentContext.mounted) {
            currentContext.read<ImageCubit>().setImage(file);
            onImageSelected(file);
          }
        } else {
          if (currentContext.mounted) {
            ScaffoldMessenger.of(currentContext).showSnackBar(
              const SnackBar(
                content: Text(
                    'File size exceeds 5MB. Please select a smaller file.'),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (currentContext.mounted) {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          SnackBar(
            content: Text('Failed to pick image: $e'),
          ),
        );
      }
    }
  }
}