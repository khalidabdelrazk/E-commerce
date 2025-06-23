import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entity/category_or_brand_response_entity.dart';

abstract class GetCategoryDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories({
    required num limit,
    required num page,
    required String keyword,
  });
}
