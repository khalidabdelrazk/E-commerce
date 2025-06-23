import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/home%20tab/domain/entity/category_or_brand_response_entity.dart';
import 'package:ecommerce/presentation/home%20tab/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoryUseCase {
  HomeRepository homeRepository;
  GetCategoryUseCase({required this.homeRepository});
  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke({
    num limit = 50,
    num page = 1,
    String keyword = '',
  }) {
    return homeRepository.getCategories(limit: limit, page: page, keyword: keyword);
  }
}
