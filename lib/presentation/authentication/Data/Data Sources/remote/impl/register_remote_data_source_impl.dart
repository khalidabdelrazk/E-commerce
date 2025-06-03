import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/core/api%20manager/api_constants.dart';
import 'package:ecommerce/core/api%20manager/api_endpints.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/presentation/authentication/Data/Data%20Sources/remote/register_remote_data_source.dart';
import 'package:ecommerce/presentation/authentication/Data/Models/register_response_dm.dart';
import 'package:ecommerce/presentation/authentication/Domain/Entity/register_response_entity.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/error/failures.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  ApiManager apiManager;
  RegisterRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  ) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    try {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          endPoints: ApiEndPoints.register,
          data: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": rePassword,
            "phone": phone,
          },
        );
        RegisterResponseDm registerResponse = RegisterResponseDm.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        }
        return Left(ServerError(errorMessage: registerResponse.message!));
      } else {
        return Left(NetworkError(errorMessage: "Network Error"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
