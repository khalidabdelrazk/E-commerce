import 'package:ecommerce/presentation/home%20tab/domain/entity/category_or_brand_response_entity.dart';

abstract class HomeStates {}

class LoadingState extends HomeStates {}

class ErrorState extends HomeStates {
  String errorMessage;
  ErrorState({required this.errorMessage});
}

class CategorySuccessState extends HomeStates {
  CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
  CategorySuccessState({required this.categoryOrBrandResponseEntity});
}

class BrandsSuccessState extends HomeStates {
  CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
  BrandsSuccessState({required this.categoryOrBrandResponseEntity});
}

// class LoadingState extends HomeStates {}
