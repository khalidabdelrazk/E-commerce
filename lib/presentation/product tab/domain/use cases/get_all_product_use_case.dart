import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/product%20tab/domain/entity/product_response_entity.dart';
import 'package:ecommerce/presentation/product%20tab/domain/repository/get_all_product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductUseCase {
  GetAllProductRepository getAllProductRepository;
  GetAllProductUseCase({required this.getAllProductRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return getAllProductRepository.getProducts();
  }
}
