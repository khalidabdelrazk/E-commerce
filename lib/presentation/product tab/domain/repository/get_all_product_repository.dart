import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/product%20tab/domain/entity/product_response_entity';

abstract class GetAllProductRepository {
  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
