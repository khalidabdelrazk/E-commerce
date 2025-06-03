import 'package:ecommerce/presentation/authentication/Domain/Entity/register_response_entity.dart';
import 'package:ecommerce/presentation/authentication/Domain/Repository/register_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/error/failures.dart';import 'package:either_dart/either.dart';

@Injectable()
class RegisterUseCase {
  final RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
  Future<Either<Failures, RegisterResponseEntity>> invoke(
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  ) {
    return registerRepository.register(name, email, password, rePassword, phone);
  }
}
