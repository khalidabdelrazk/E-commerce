import 'package:ecommerce/presentation/authentication/Domain/Entity/register_response_entity.dart';

abstract class RegisterStates {}

class InitState extends RegisterStates{}

class ShowLoading extends RegisterStates {}

class SuccessState extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;
  SuccessState(this.registerResponseEntity);
}

class ErrorState extends RegisterStates {
  String errorMessage;
  ErrorState(this.errorMessage);
}
