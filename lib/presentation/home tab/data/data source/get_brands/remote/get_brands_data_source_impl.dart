import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/home%20tab/data/data%20source/get_brands/get_brands_data_source.dart';
import 'package:ecommerce/presentation/home%20tab/data/model/category_or_brand_response_dm.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api manager/api_endpints.dart';

@Injectable(as: GetBrandsDataSource)
class GetBrandsDataSourceImpl extends GetBrandsDataSource {
  ApiManager apiManager;
  GetBrandsDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getBrands({
    required num limit,
    required String keyword,
  }) async {
    try {
      final List<ConnectivityResult> connectivity =
          await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.wifi) ||
          connectivity.contains(ConnectivityResult.ethernet)) {
        final response = await apiManager.getData(
          path: ApiEndPoints.getAllBrands,
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
