import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entity/category_or_brand_response_entity.dart';

abstract class GetBrandsDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands({
    required num limit,
    required String keyword,
  });
}
