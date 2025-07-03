import 'package:ecommerce/core/error/failures.dart';
import 'package:either_dart/either.dart';

import '../../../Domain/Entity/login_response_entity.dart';

abstract class LoginDataSource {
  Future<Either<Failures, AuthResponseEntity>> login(
    String email,
    String password,
  );
}
