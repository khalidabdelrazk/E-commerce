import 'package:bloc/bloc.dart';
import 'package:ecommerce/presentation/authentication/Domain/Use%20Case/register_use_case.dart';
import 'package:ecommerce/presentation/authentication/Features/Cubit/Register/register_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}) : super(InitState());

  final emailController = TextEditingController(
    text: 'khalidmohammed1@gmail.com',
  );
  final nameController = TextEditingController(text: 'khalidMohammed');
  final phoneController = TextEditingController(text: '01015565612');
  final passwordController = TextEditingController(text: '"Ahmed@123"');
  final rePasswordController = TextEditingController(text: '"Ahmed@123"');
  final formKey = GlobalKey<FormState>();
  register() async{
    if (formKey.currentState?.validate() == true) {
      emit(ShowLoading());
      var either = await registerUseCase.invoke(
        emailController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );
      either.fold((left) => emit(ErrorState(left.errorMessage)),(right) => emit(SuccessState(right)),);
    }
  }
}
