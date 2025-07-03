import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/product%20tab/data/data%20source/get_all_product_data_source.dart';
import 'package:ecommerce/presentation/product%20tab/domain/repository/get_all_product_repository.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/product_response_entity.dart';

@Injectable(as: GetAllProductRepository)
class GetALlProductRepositoryImpl implements GetAllProductRepository {
  GetALlProductDataSource getALlProductDataSource;
  GetALlProductRepositoryImpl({required this.getALlProductDataSource});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return getALlProductDataSource.getProducts();
  }
}
