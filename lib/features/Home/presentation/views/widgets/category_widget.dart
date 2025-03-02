import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/gredient_container.dart';
import 'package:pollo/features/Home/data/category_item.dart';

class CategoryWidget extends StatelessWidget {
  final List<Category> categories;
  final String categoryName;
  final String image;

  const CategoryWidget({super.key, required this.categories, required this.categoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
            child: Row(
              children: [
                // Back Arrow
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  color: AppColors.iconColor,
                ),

                Spacer(),

                Text(
                  categoryName,
                  style: TextStyles.appbar_category_style,
                ),
                Spacer(),
                SizedBox(width: 48.w),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          categories[0].items.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 300.h),
                Image.network(
                  Assets.empty_sheep,
                  width: 100.w,
                  height: 100.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  "There are no data",
                  style: TextStyles.no_data,
                ),
              ],
            ),
          )
              : Column(
            children: [
              // GradientContainer
              GradientContainer(
                contentList: categories[0].contentList,
              ),
              SizedBox(height: 10.h),
              // Rest of the content
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 15.h, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Text(
                        "Available", // Your text here
                        style: TextStyles.available_text,
                      ),
                    ),
                    // GridView
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: categories[0].items.length,
                      itemBuilder: (context, index) {
                        final item = categories[0].items[index];
                        return Stack(
                          children: [

                            Container(
                              width: 164.w,
                              height: 190.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r), // Radius of 10
                                gradient: AppColors.mainColor, // Use your gradient here
                              ),
                            ),

                            Positioned(
                              top: 1.h,
                              left: 1.w,
                              child: Container(
                                width: 162.w,
                                height: 184.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.category_container,
                                ),
                              ),
                            ),

                            Positioned(
                              top: 10.h,
                              left: 10.w,
                              right: 10.w,
                              child: Container(
                                height: 170.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Container(
                                      width: 133.w,
                                      height: 133.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.r),
                                        gradient: AppColors.mainColor,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        // Centered Image
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(6.r),
                                          child: Image.network(
                                            item.image,
                                            width: 132.w,
                                            height: 132.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h), // Equal vertical spacing
                                    // Text
                                    Text(
                                      item.text,
                                      textAlign: TextAlign.center,
                                      style: TextStyles.categories_text,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}