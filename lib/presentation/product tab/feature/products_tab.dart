import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/presentation/product%20tab/feature/cubit/product_tab_states.dart';
import 'package:ecommerce/presentation/product%20tab/feature/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/product_tab_item.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/network_error_widget.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  ProductTabViewModel productTabViewModel = getIt<ProductTabViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productTabViewModel.getProducts();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: productTabViewModel,
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is ProductErrorState) {
          return NetworkErrorWidget(errorMsg: state.errorMessage, large: false);
        } else if (state is ProductSuccessState) {
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
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.productResponseEntity.data?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //todo: navigate to product details screen
                          Navigator.pushNamed(context, AppRoutes.productRoute);
                        },
                        child: ProductTabItem(dataEntity: state.productResponseEntity.data?[index],),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const Scaffold(backgroundColor: Colors.green);
      },
    );
  }
}

/*
SafeArea(
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
                mainAxisSpacing: 16.h,
              ),
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
            ),
          ),
        ],
      ),
    )
 */
