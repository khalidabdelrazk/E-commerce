import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/home%20tab/data/data%20source/get_categories/get_category_data_source.dart';
import 'package:ecommerce/presentation/home%20tab/data/model/category_or_brand_response_dm.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api manager/api_endpints.dart';

@Injectable(as: GetCategoryDataSource)
class GetCategoryDataSourceImpl extends GetCategoryDataSource {
  ApiManager apiManager;
  GetCategoryDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getCategories({
    required num limit,
    required num page,
    required String keyword,
  }) async {
    try {
      final List<ConnectivityResult> connectivity =
          await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.wifi) ||
          connectivity.contains(ConnectivityResult.ethernet)) {
        final response = await apiManager.getData(
          path: ApiEndPoints.getAllCategories,
          options: Options(validateStatus: (status) => true),
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(CategoryOrBrandResponseDm.fromJson(response.data));
        }
        return Left(
          ServerError(
            errorMessage:
                CategoryOrBrandResponseDm.fromJson(response.data).message ??
                " hii",
          ),
        );
      }
      return Left(NetworkError(errorMessage: "Network Error"));
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
