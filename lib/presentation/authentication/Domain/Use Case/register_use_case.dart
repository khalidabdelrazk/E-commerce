import 'package:ecommerce/presentation/authentication/Domain/Repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/error/failures.dart';
import 'package:either_dart/either.dart';

import '../Entity/login_response_entity.dart';

@Injectable()
class RegisterUseCase {
  final AuthRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
  Future<Either<Failures, AuthResponseEntity>> invoke(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  ) {
    return registerRepository.register(
      name,
      email,
      password,
      rePassword,
      phone,
    );
  }
}
