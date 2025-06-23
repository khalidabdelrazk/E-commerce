import 'package:ecommerce/presentation/authentication/Domain/Entity/login_response_entity.dart';

class LoginResponseDm extends AuthResponseEntity {
  LoginResponseDm({super.message, super.user, super.statusMsg, super.token});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDm.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserDm extends UserEntity {
  UserDm({super.name, super.email, super.role});

  UserDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
