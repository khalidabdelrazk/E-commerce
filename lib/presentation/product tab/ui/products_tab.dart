import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/product_tab_item.dart';
import '../../../core/utils/app_routes.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.2.h,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h),
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //todo: navigate to product details screen
                Navigator.pushNamed(context, AppRoutes.productRoute);
              },
              child: const ProductTabItem(),
            );
          },
        ))
      ],
    ));
  }
}
