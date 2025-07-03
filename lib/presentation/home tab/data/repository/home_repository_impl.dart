import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/home%20tab/data/data%20source/get_brands/get_brands_data_source.dart';
import 'package:ecommerce/presentation/home%20tab/data/data%20source/get_brands/remote/get_brands_data_source_impl.dart';
import 'package:ecommerce/presentation/home%20tab/data/data%20source/get_categories/get_category_data_source.dart';
import 'package:ecommerce/presentation/home%20tab/domain/entity/category_or_brand_response_entity.dart';
import 'package:ecommerce/presentation/home%20tab/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final GetCategoryDataSource getCategoryDataSource;
  final GetBrandsDataSource getBrandsDataSource;
  HomeRepositoryImpl({
    required this.getCategoryDataSource,
    required this.getBrandsDataSource,
  });

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories({
    required num limit,
    required num page,
    required String keyword,
  }) async {
    var either = await getCategoryDataSource.getCategories(
      limit: limit,
      page: page,
      keyword: keyword,
    );
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands({
    required num limit,
    required String keyword,
  }) async {
    var either = await getBrandsDataSource.getBrands(
      limit: limit,
      keyword: keyword,
    );
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
