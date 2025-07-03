import '../../Domain/Entity/login_response_entity.dart';

abstract class AuthStates {}

class InitState extends AuthStates {}

class ShowLoading extends AuthStates {}

class SuccessState extends AuthStates {
  AuthResponseEntity registerResponseEntity;
  SuccessState(this.registerResponseEntity);
}

class ErrorState extends AuthStates {
  String errorMessage;
  ErrorState(this.errorMessage);
}
