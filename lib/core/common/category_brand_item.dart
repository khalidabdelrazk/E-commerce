import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CategoryBrandItem extends StatelessWidget {
  final String imgUrl, title;
  const CategoryBrandItem({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  bool _isValidImageUrl(String url) {
    return url.isNotEmpty &&
        (url.startsWith('http://') || url.startsWith('https://')) &&
        (url.endsWith('.png') || url.endsWith('.jpg') || url.endsWith('.jpeg') || url.contains('image'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: _isValidImageUrl(imgUrl)
              ? CachedNetworkImage(
            width: double.infinity,
            height: 10.h,
            fit: BoxFit.cover,
            imageUrl: imgUrl,
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                backgroundImage: imageProvider,
                radius: 50.r,
              );
            },
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: AppColors.primaryDark),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.broken_image, color: AppColors.redColor),
          )
              : const Icon(Icons.broken_image, color: AppColors.redColor),
        ),
        SizedBox(height: 8.h),
        Expanded(
          flex: 4,
          child: Text(
            title,
            textWidthBasis: TextWidthBasis.longestLine,
            softWrap: true,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
