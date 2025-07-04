import 'package:ecommerce/core/common/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/custom_badge.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../favourite tab/ui/favorite_tab.dart';
import '../../home tab/ui/home_tab.dart';
import '../../product tab/feature/products_tab.dart';
import '../../user tab/ui/user_tab.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedIndex = 0;

  void bottomNavOnTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(selectedIndex),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: barItems[selectedIndex]["page"],
      ),
      bottomNavigationBar: getBottomBar(), // ✅ Use this instead of floatingActionButton
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          barItems.length,
              (index) => BottomBarItem(
            selectedIndex == index
                ? barItems[index]["active_icon"]
                : barItems[index]["icon"],
            "",
            isActive: selectedIndex == index,
            activeColor: Theme.of(context).primaryColor,
            onTap: () => bottomNavOnTap(index),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
      borderRadius: BorderRadius.circular(50.r),
    );
  }

  PreferredSizeWidget _buildAppBar(int index) {
    return AppBar(
      surfaceTintColor: AppColors.transparentColor,
      elevation: 0,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset(
                AppAssets.routeLogo,
                width: 66.w,
                height: 22.h,
              ),
            ),
            if (index != 3)
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: AppStyles.regular14Text,
                        cursorColor: AppColors.primaryColor,
                        onTap: () {
                          // TODO: implement search logic
                        },
                        decoration: InputDecoration(
                          border: _buildCustomBorder(),
                          enabledBorder: _buildCustomBorder(),
                          focusedBorder: _buildCustomBorder(),
                          contentPadding: EdgeInsets.all(16.h),
                          hintStyle: AppStyles.light14SearchHint,
                          hintText: "what do you search for?",
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30.sp,
                            color: AppColors.primaryColor.withOpacity(0.75),
                          ),
                        ),
                      ),
                    ),
                    const CustomAppBarBadge(count: 5),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> get barItems => [
    {
      "icon": AppAssets.unSelectedHomeIcon,
      "active_icon": AppAssets.selectedHomeIcon,
      "page": HomeTab(),
    },
    {
      "icon": AppAssets.unSelectedCategoryIcon,
      "active_icon": AppAssets.selectedCategoryIcon,
      "page": const ProductsTab(),
    },
    {
      "icon": AppAssets.unSelectedFavouriteIcon,
      "active_icon": AppAssets.selectedFavouriteIcon,
      "page": FavoriteTab(),
    },
    {
      "icon": AppAssets.unSelectedAccountIcon,
      "active_icon": AppAssets.selectedAccountIcon,
      "page": const UserTab(),
    },
  ];
}
