import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/category_or_brand_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories({
    required num limit,
    required num page,
    required String keyword,
  });
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands({
    required num limit,
    required String keyword,
  });
}
