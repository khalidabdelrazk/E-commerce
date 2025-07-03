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
  final ProductTabViewModel productTabViewModel = getIt<ProductTabViewModel>();

  @override
  void initState() {
    super.initState();
    productTabViewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewModel, ProductStates>(
      bloc: productTabViewModel,
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductErrorState) {
          return NetworkErrorWidget(errorMsg: state.errorMessage, large: false);
        }
        if (state is ProductSuccessState) {
          final items = state.productResponseEntity.data ?? [];

          return Padding(
            padding: EdgeInsets.all(8.w),
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 500 ? 3 : 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.65, // Adjust to fit item height
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.productRoute),
                  child: ProductTabItem(dataEntity: items[index]),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink(); // fallback
      },
    );
  }
}
