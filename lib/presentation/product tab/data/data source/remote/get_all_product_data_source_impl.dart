import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api%20manager/api_endpints.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../../model/product_response_dm.dart';
import '../get_all_product_data_source.dart';

@Injectable(as: GetALlProductDataSource)
class GetAllProductDataSourceImpl extends GetALlProductDataSource {
  ApiManager apiManager;
  GetAllProductDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, ProductResponseDm>> getProducts() async {
    try {
      final List<ConnectivityResult> connectivity =
          await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.wifi) ||
          connectivity.contains(ConnectivityResult.other) ||
          connectivity.contains(ConnectivityResult.vpn) ||
          connectivity.contains(ConnectivityResult.bluetooth) ||
          connectivity.contains(ConnectivityResult.none) ||
          connectivity.contains(ConnectivityResult.ethernet)) {
        final response = await apiManager.getData(
          path: ApiEndPoints.getAllProducts,
          options: Options(validateStatus: (status) => true),
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(ProductResponseDm.fromJson(response.data));
        }
        return Left(
          ServerError(
            errorMessage:
                ProductResponseDm.fromJson(response.data).message ?? " hii",
          ),
        );
      }
      return Left(NetworkError(errorMessage: "Network Error"));
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
