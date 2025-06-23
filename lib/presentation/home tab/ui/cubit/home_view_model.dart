import 'package:bloc/bloc.dart';
import 'package:ecommerce/presentation/home%20tab/domain/entity/category_or_brand_response_entity.dart';
import 'package:ecommerce/presentation/home%20tab/domain/usecase/get_brands_use_case.dart';
import 'package:ecommerce/presentation/home%20tab/domain/usecase/get_category_use_case.dart';
import 'package:ecommerce/presentation/home%20tab/ui/cubit/home_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  final GetCategoryUseCase getCategoryUseCase;
  final GetBrandsUseCase getBrandsUseCase;
  HomeViewModel({
    required this.getCategoryUseCase,
    required this.getBrandsUseCase,
  }) : super(LoadingState());

  // List<DataEntity> data = [];

  Future<void> getCategories() async {
    emit(LoadingState());
    var response = await getCategoryUseCase.invoke();

    response.fold(
      (error) => emit(ErrorState(errorMessage: error.errorMessage)),
      (response) {
        // data = response.data ?? [];
        emit(CategorySuccessState(categoryOrBrandResponseEntity: response));
      },
    );
  }

  Future<void> getBrands() async {
    emit(LoadingState());
    var response = await getBrandsUseCase.invoke();

    response.fold(
      (error) => emit(ErrorState(errorMessage: error.errorMessage)),
      (response) {
        // data = response.data ?? [];
        emit(BrandsSuccessState(categoryOrBrandResponseEntity: response));
      },
    );
  }
}
