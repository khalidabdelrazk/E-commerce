import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api%20manager/api_endpints.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/authentication/Data/Data%20Sources/login/login_data_source.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../Models/login_response_dm.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource {
  ApiManager apiManager;
  LoginDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, LoginResponseDm>> login(
    String email,
    String password,
  ) async {
    try{
      final List<ConnectivityResult> connectivity =
      await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.wifi) ||
          connectivity.contains(ConnectivityResult.ethernet)) {
        final response = await apiManager.postData(
          path: ApiEndPoints.signIn,
          data: {"email": email, "password": password},
          options: Options(validateStatus: (status) => true,),
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(LoginResponseDm.fromJson(response.data));
        }
        return Left(ServerError(errorMessage: LoginResponseDm.fromJson(response.data).message ?? " hii"));
      }
      return Left(NetworkError(errorMessage: "Network Error"));
    }catch(e){
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
