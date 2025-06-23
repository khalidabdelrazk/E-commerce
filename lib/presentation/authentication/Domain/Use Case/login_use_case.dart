import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/presentation/authentication/Domain/Repository/auth_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../Entity/login_response_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<Failures, AuthResponseEntity>> invoke(
    String email,
    String password,
  ) {
    return authRepository.login(email, password);
  }
}
