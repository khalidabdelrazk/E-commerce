import 'package:ecommerce/presentation/authentication/Data/Data%20Sources/login/login_data_source.dart';
import 'package:ecommerce/presentation/authentication/Domain/Entity/login_response_entity.dart';
import 'package:ecommerce/presentation/authentication/Domain/Repository/auth_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/error/failures.dart';
import '../Data Sources/register/register_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final RegisterRemoteDataSource registerRemoteDataSource;
  final LoginDataSource loginDataSource;
  AuthRepositoryImpl(
    this.loginDataSource, {
    required this.registerRemoteDataSource,
  });
  @override
  Future<Either<Failures, AuthResponseEntity>> register(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  ) async {
    var either = await registerRemoteDataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
    );

    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AuthResponseEntity>> login(
    String email,
    String password,
  ) async {
    var either = await loginDataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
