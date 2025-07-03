import 'package:bloc/bloc.dart';
import 'package:ecommerce/presentation/product%20tab/domain/use%20cases/get_all_product_use_case.dart';
import 'package:ecommerce/presentation/product%20tab/feature/cubit/product_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductStates> {
  GetAllProductUseCase getAllProductUseCase;
  ProductTabViewModel({required this.getAllProductUseCase})
    : super(ProductLoadingState());

  Future<void> getProducts() async {
    var response = await getAllProductUseCase.invoke();

    response.fold(
      (error) => emit(ProductErrorState(errorMessage: error.errorMessage)),
      (response) {
        // data = response.data ?? [];
        emit(ProductSuccessState(productResponseEntity: response));
      },
    );
  }
}
