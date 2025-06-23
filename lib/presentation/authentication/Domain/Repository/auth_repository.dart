import 'package:either_dart/either.dart';
import '../../../../../../core/error/failures.dart';
import '../Entity/login_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, AuthResponseEntity>> register(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  );

  Future<Either<Failures, AuthResponseEntity>> login(
    String email,
    String password,
  );
}
