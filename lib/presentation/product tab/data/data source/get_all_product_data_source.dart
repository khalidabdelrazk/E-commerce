import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import '../model/product_response_dm.dart';

abstract class GetALlProductDataSource {
  Future<Either<Failures, ProductResponseDm>> getProducts();
}
