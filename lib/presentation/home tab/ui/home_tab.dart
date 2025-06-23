import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/dialog_utils.dart';
import 'package:ecommerce/core/utils/network_error_widget.dart';
import 'package:ecommerce/presentation/home%20tab/ui/cubit/home_states.dart';
import 'package:ecommerce/presentation/home%20tab/ui/cubit/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/category_brand_item.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final HomeViewModel homeViewModel = getIt<HomeViewModel>();

  bool initialized = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!initialized) {
      homeViewModel.getCategories();
      homeViewModel.getBrands();
      bool initialized = true;

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildAnnouncement(
            images: [
              AppAssets.announcement1,
              AppAssets.announcement2,
              AppAssets.announcement3,
            ],
          ),
          SizedBox(height: 24.h),
          _lineBreak(name: "Categories"),
          _buildCategorySec(),
          SizedBox(height: 24.h),
          _lineBreak(name: "Brands"),
          _buildBrandSec(),
        ],
      ),
    );
  }

  _buildCategorySec() {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: homeViewModel,
      buildWhen: (previous, current) => current is CategorySuccessState || current is ErrorState,
      builder: (context, state) {
        if (state is ErrorState) {
          return NetworkErrorWidget(errorMsg: state.errorMessage, large: false);
        } else if (state is CategorySuccessState) {
          return SizedBox(
            height: 250.h,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
              ),
              itemCount: state.categoryOrBrandResponseEntity.data?.length,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return CategoryBrandItem(
                  imgUrl: state.categoryOrBrandResponseEntity.data?[index].image ?? '',
                  title: state.categoryOrBrandResponseEntity.data?[index].name ?? 'hi',
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }


  _buildBrandSec() {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: homeViewModel,
      buildWhen: (previous, current) => current is BrandsSuccessState || current is ErrorState,
      builder: (context, state) {
        if (state is ErrorState) {
          return NetworkErrorWidget(errorMsg: state.errorMessage, large: false);
        } else if (state is BrandsSuccessState) {
          return SizedBox(
            height: 250.h,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
              ),
              itemCount: state.categoryOrBrandResponseEntity.data?.length,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return CategoryBrandItem(
                  imgUrl: state.categoryOrBrandResponseEntity.data?[index].image ?? '',
                  title: state.categoryOrBrandResponseEntity.data?[index].name ?? 'hi',
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children:
          images.map((url) {
            return Image.asset(url, fit: BoxFit.fill);
          }).toList(),
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {
            //todo: navigate to all
          },
          child: Text("View All", style: AppStyles.regular12Text),
        ),
      ],
    );
  }
}
