import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/presentation/product%20tab/domain/entity/product_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class ProductTabItem extends StatelessWidget {
  const ProductTabItem({super.key, required this.dataEntity});
  final DataEntity? dataEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary30Opacity, width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 191.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: dataEntity?.imageCover ?? " ",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: AppColors.redColor),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  radius: 20.r,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        // todo add to favorite
                      },
                      color: AppColors.primaryColor,
                      padding: EdgeInsets.zero,
                      iconSize: 30.r, // Adjust icon size as needed
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  dataEntity?.subcategory?[0].name ?? " ",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                AutoSizeText(
                  dataEntity?.description ?? " hi",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    AutoSizeText(
                      dataEntity!.price.toString(),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    AutoSizeText(
                      (dataEntity?.price ?? 0 * 1.1).toString(),
                      maxLines: 1,
                      style: AppStyles.regular11SalePrice.copyWith(
                        color: AppColors.discountTextColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    AutoSizeText(
                      dataEntity!.ratingsAverage.toString(),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    Icon(Icons.star, color: AppColors.yellowColor, size: 25.sp),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () {
                        //   todo add to cart
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
