import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/dialog_utils.dart';
import 'package:ecommerce/presentation/authentication/Features/Cubit/auth_states.dart';
import 'package:ecommerce/presentation/authentication/Features/Cubit/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_button.dart';
import '../../../common/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;

  AuthViewModel authViewModel = getIt<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocListener<AuthViewModel, AuthStates>(
      bloc: authViewModel,
      listener: (context, state) {
        if (state is ShowLoading) {
          DialogUtils.showLoading(context: context);
        } else if (state is ErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
          );
        } else if (state is SuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.registerResponseEntity.user?.name ?? " hii ",
          );
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: 5,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.3,
                    child: Image.asset(AppAssets.appBarLeading),
                  ),
                  Form(
                    key: authViewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email", style: AppStyles.light16White),
                        SizedBox(height: height * 0.01),
                        CustomTextField(
                          label: "Email",
                          labelColor: AppColors.iconsColor,
                          controller: authViewModel.emailController,
                          borderColor: AppColors.whiteColor,
                          prefixIcon: Icons.email_rounded,
                          prefixIconColor: AppColors.iconsColor,
                          keyboardType: TextInputType.emailAddress,
                          validator: (p0) => AppValidators.validateEmail(p0),
                          inputColor: AppColors.primaryColor,
                        ),
                        SizedBox(height: height * 0.02),
                        Text("password", style: AppStyles.light16White),
                        SizedBox(height: height * 0.01),
                        CustomTextField(
                          label: "Password",
                          labelColor: AppColors.iconsColor,
                          controller: authViewModel.passwordController,
                          borderColor: AppColors.whiteColor,
                          prefixIcon: Icons.lock_sharp,
                          prefixIconColor: AppColors.iconsColor,
                          maxLines: 1,
                          obscureText: hidePassword,
                          // keyboardType: TextInputType.visiblePassword,
                          validator: (p0) => AppValidators.validatePassword(p0),
                          inputColor: AppColors.primaryColor,
                          suffixIcon:
                              hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                          suffixIconColor: AppColors.iconsColor,
                          onSuffixPressed: () {
                            hidePassword = !hidePassword;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        txt: "Forget Password",
                        onPressed: () {
                          // Navigator.pushNamed(context, RouteNames.forgetPassword);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  CustomButton(
                    text: "Login",
                    onPressed: () {
                      authViewModel.login();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Don't have an account?",
                          style: AppStyles.light16White,
                        ),
                      ),
                      CustomTextButton(
                        txt: "Create Account",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.registerRoute);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
