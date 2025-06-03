import 'package:ecommerce/presentation/authentication/Data/Data%20Sources/remote/register_remote_data_source.dart';
import 'package:ecommerce/presentation/authentication/Domain/Entity/register_response_entity.dart';
import 'package:ecommerce/presentation/authentication/Domain/Repository/register_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/error/failures.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDataSource registerRemoteDataSource;
  RegisterRepositoryImpl({required this.registerRemoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
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
}
