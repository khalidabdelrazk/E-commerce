import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import '../entity/product_response_entity.dart';

abstract class GetAllProductRepository {
  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
