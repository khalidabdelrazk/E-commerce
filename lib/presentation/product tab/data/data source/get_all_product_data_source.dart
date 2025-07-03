import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/product%20tab/data/model/product_response_dm';

abstract class GetALlProductDataSource {
  Future<Either<Failures, ProductResponseDm>> getProducts();
}
