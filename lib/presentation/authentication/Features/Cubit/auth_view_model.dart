import 'package:bloc/bloc.dart';
import 'package:ecommerce/presentation/authentication/Domain/Use%20Case/login_use_case.dart';
import 'package:ecommerce/presentation/authentication/Domain/Use%20Case/register_use_case.dart';
import 'package:ecommerce/presentation/authentication/Features/Cubit/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends Cubit<AuthStates> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  AuthViewModel(this.loginUseCase, {required this.registerUseCase})
    : super(InitState());

  final emailController = TextEditingController(
    text: 'khalidabdelrazk2@gmail.com',
  );
  final nameController = TextEditingController(text: 'khalidMohammed');
  final phoneController = TextEditingController(text: '01015565612');
  final passwordController = TextEditingController(text: 'Khalid@123');
  final rePasswordController = TextEditingController(text: 'Khalid@123');
  final formKey = GlobalKey<FormState>();

  register() async {
    if (formKey.currentState?.validate() == true) {
      emit(ShowLoading());
      var either = await registerUseCase.invoke(
        emailController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );
      either.fold(
        (left) => emit(ErrorState(left.errorMessage)),
        (right) => emit(SuccessState(right)),
      );
    }
  }

  login() async {
    if (formKey.currentState?.validate() == true) {
      emit(ShowLoading());
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold(
        (left) => emit(ErrorState(left.errorMessage)),
        (right) => emit(SuccessState(right)),
      );
    }
  }
}
