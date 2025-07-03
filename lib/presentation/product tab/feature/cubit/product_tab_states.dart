import 'package:ecommerce/presentation/product%20tab/domain/entity/product_response_entity.dart';

abstract class ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductErrorState extends ProductStates {
  String errorMessage;
  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductStates {
  ProductResponseEntity productResponseEntity;
  ProductSuccessState({required this.productResponseEntity});
}

