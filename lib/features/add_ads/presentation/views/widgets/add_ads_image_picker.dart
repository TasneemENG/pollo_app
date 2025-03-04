import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';

class AddAdsImagePicker extends StatefulWidget {
  final ValueChanged<File?> onImageSelected;

  const AddAdsImagePicker({
    super.key,
    required this.onImageSelected,
  });

  @override
  State<AddAdsImagePicker> createState() => _AddAdsImagePickerState();
}

class _AddAdsImagePickerState extends State<AddAdsImagePicker> {
  File? _imageFile;

  Future<void> _pickImage() async {
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
        setState(() {
          _imageFile = file;
        });
        widget.onImageSelected(file);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('File size exceeds 5MB. Please select a smaller file.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 343.w,
        height: 204.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.background,
        ),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return AppColors.reverse_mainColor.createShader(bounds);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.background, // Base border color (masked by gradient)
                width: 2.w,
              ),
            ),
            child: _imageFile == null
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
                    border: Border.all(
                      color: AppColors.graytxt.withOpacity(0.3),
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: GradientText(
                      text: 'Add Image',
                      style: TextStyles.font16Solid.copyWith(color: AppColors.background),
                    ),
                  ),
                ),
                4.verticalSpace,
                Text(
                  '5MB maximum file size accepted in\n the following formats: .jpg, .png',
                  textAlign: TextAlign.center,
                  style: TextStyles.font16Medium.copyWith(color: AppColors.graytxt),
                ),
              ],
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.file(
                _imageFile!,
                width: 343.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
