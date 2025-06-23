import 'package:either_dart/either.dart';
import '../../../../../core/error/failures.dart';
import '../../../Domain/Entity/login_response_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<Failures, AuthResponseEntity>> register(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  );
}
