import 'package:ecommerce/presentation/authentication/Domain/Entity/register_response_entity.dart';
import 'package:either_dart/either.dart';
import '../../../../../../core/error/failures.dart';

abstract class RegisterRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  );
}
