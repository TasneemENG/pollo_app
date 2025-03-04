import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/app_check_box.dart';
import 'package:pollo/core/widgets/app_text_form_field.dart';
import 'package:pollo/core/widgets/drop_down_widget.dart';
import 'package:pollo/features/add_ads/presentation/manager/image_picker/image_picker_cubit.dart';
import 'package:pollo/features/add_ads/presentation/views/widgets/add_ads_image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdsForm extends StatefulWidget {
  const AddAdsForm({super.key});

  @override
  State<AddAdsForm> createState() => _AddAdsFormState();
}

class _AddAdsFormState extends State<AddAdsForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    phoneController.dispose();
    priceController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 10.r),
        child: Column(
          children: [
            // Image Picker
            AddAdsImagePicker(
              onImageSelected: (file) {
                context.read<ImageCubit>().setImage(file);
              },
            ),
            16.verticalSpace,
            // Category Dropdown
            CustomDropdownWidget(
              dropdownName: "Category*",
              options: const ["Category 1", "Category 2", "Category 3"],
              onChanged: (value) {},
            ),
            16.verticalSpace,

            // Subcategory Dropdown
            CustomDropdownWidget(
              dropdownName: "Subcategory*",
              options: const [
                "Subcategory 1",
                "Subcategory 2",
                "Subcategory 3"
              ],
              onChanged: (value) {},
            ),
            16.verticalSpace,

            // Ad Title
            AppTextFormField(
              labelText: "Ad Title*",
              hintText: "Enter Title",
              controller: titleController,
              isPassword: false,
              isObscured: false,
              togglePasswordVisibility: () {},
              labelStyle: TextStyles.font18Semibold,
              hintStyle:
                  TextStyles.font16Medium.copyWith(color: AppColors.bodyText),
            ),
            16.verticalSpace,

            // Phone Number
            AppTextFormField(
              labelText: "Phone*",
              hintText: "+201010101010",
              controller: phoneController,
              isPassword: false,
              isObscured: false,
              togglePasswordVisibility: () {},
              labelStyle: TextStyles.font18Semibold,
              hintStyle:
                  TextStyles.font16Medium.copyWith(color: AppColors.bodyText),
            ),
            16.verticalSpace,

            // Price
            AppTextFormField(
              labelText: "Price*",
              hintText: "Enter Price",
              controller: priceController,
              isPassword: false,
              isObscured: false,
              isPrice: true,
              togglePasswordVisibility: () {},
              labelStyle: TextStyles.font18Semibold,
              hintStyle:
                  TextStyles.font16Medium.copyWith(color: AppColors.bodyText),
            ),
            10.verticalSpace,

            // Negotiable Checkbox
            Padding(
              padding: EdgeInsets.only(left: 8.r),
              child: const AppCheckbox(
                checkboxName: 'negotiable',
                label: 'Negotiable',
              ),
            ),
            16.verticalSpace,

            // Details
            AppTextFormField(
              labelText: "Details*",
              hintText: "Describe The Item You Are Selling",
              controller: detailsController,
              isPassword: false,
              isObscured: false,
              isDetails: true,
              togglePasswordVisibility: () {},
              labelStyle: TextStyles.font18Semibold,
              hintStyle:
                  TextStyles.font16Medium.copyWith(color: AppColors.bodyText),
            ),
            16.verticalSpace,

            // Location Dropdown
            CustomDropdownWidget(
              dropdownName: "Location*",
              options: const ["Location 1", "Location 2", "Location 3"],
              onChanged: (value) {},
            ),
            30.verticalSpace,

            // Submit Button
            AppButton(
              onPressed: () {},
              text: 'Add',
              width: 246.w,
              height: 48.h,
              borderRadius: 30.r,
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
