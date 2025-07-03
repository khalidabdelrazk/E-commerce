import '../../Domain/Entity/login_response_entity.dart';

class RegisterResponseDm extends AuthResponseEntity {
  RegisterResponseDm({super.message, super.user, super.token, super.statusMsg});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
