import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/dialog_utils.dart';
import 'package:ecommerce/presentation/authentication/Features/Cubit/auth_states.dart';
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
import '../Cubit/auth_view_model.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthViewModel registerViewModel = getIt<AuthViewModel>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocListener(

      bloc: registerViewModel,
      listener: (context, state) {
        if (state is ShowLoading) {
          return DialogUtils.showLoading(
            context: context,
          );
        } else if (state is ErrorState) {
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
            title: "Error",
            posActionName: 'Ok',
          );
        } else if(state is SuccessState){
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
            context: context,
            message: 'Account Created Successfully',
            title: "Success",
            posActionName: 'Ok',
          );
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.2,
                    child: Image.asset(AppAssets.appBarLeading),
                  ),
                  Form(
                    key: registerViewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("UserName", style: AppStyles.light16White),
                        SizedBox(height: height * 0.01),
                        CustomTextField(
                          label: "Enter your Name",
                          labelColor: AppColors.iconsColor,
                          controller: registerViewModel.nameController,
                          borderColor: AppColors.iconsColor,
                          prefixIcon: Icons.person,
                          prefixIconColor: AppColors.iconsColor,
                          keyboardType: TextInputType.text,
                          validator: (p0) => AppValidators.validateUsername(p0),
                          inputColor: AppColors.blackColor,
                        ),
                        SizedBox(height: height * 0.02),
                        Text("Phone Number", style: AppStyles.light16White),
                        SizedBox(height: height * 0.01),
                        CustomTextField(
                          label: "Phone",
                          labelColor: AppColors.iconsColor,
                          controller: registerViewModel.phoneController,
                          borderColor: AppColors.iconsColor,
                          prefixIcon: Icons.phone,
                          prefixIconColor: AppColors.iconsColor,
                          keyboardType: TextInputType.emailAddress,
                          validator:
                              (p0) => AppValidators.validatePhoneNumber(p0),
                          inputColor: AppColors.blackColor,
                        ),
                        SizedBox(height: height * 0.02),
                        Text("E-mail Address", style: AppStyles.light16White),
                        SizedBox(height: height * 0.01),
                        CustomTextField(
                          label: "Email",
                          labelColor: AppColors.iconsColor,
                          controller: registerViewModel.emailController,
                          borderColor: AppColors.iconsColor,
                          prefixIcon: Icons.email_rounded,
                          prefixIconColor: AppColors.iconsColor,
                          keyboardType: TextInputType.emailAddress,
                          validator: (p0) => AppValidators.validateEmail(p0),
                          inputColor: AppColors.blackColor,
                        ),
                        SizedBox(height: height * 0.02),
                        Text("Password", style: AppStyles.light16White),
                        SizedBox(height: height * 0.01),
                        CustomTextField(
                          label: "Password",
                          labelColor: AppColors.iconsColor,
                          controller: registerViewModel.passwordController,
                          borderColor: AppColors.iconsColor,
                          prefixIcon: Icons.lock_sharp,
                          prefixIconColor: AppColors.iconsColor,
                          // maxLength: 12,
                          maxLines: 1,
                          obscureText: hidePassword,
                          // keyboardType: TextInputType.visiblePassword,
                          validator: (p0) => AppValidators.validatePassword(p0),
                          inputColor: AppColors.blackColor,
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
                        SizedBox(height: height * 0.02),
                        Text("Re-Password", style: AppStyles.light16White),
                        SizedBox(height: height * 0.01),
                        CustomTextField(
                          label: "Re-Password",
                          labelColor: AppColors.iconsColor,
                          controller: registerViewModel.rePasswordController,
                          borderColor: AppColors.iconsColor,
                          prefixIcon: Icons.lock_sharp,
                          prefixIconColor: AppColors.iconsColor,
                          // maxLength: 12,
                          maxLines: 1,
                          obscureText: hidePassword,
                          // keyboardType: TextInputType.visiblePassword,
                          validator:
                              (p0) => AppValidators.validateConfirmPassword(
                                p0,
                                registerViewModel.passwordController.text,
                              ),
                          inputColor: AppColors.blackColor,
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
                  SizedBox(height: height * 0.03),
                  CustomButton(
                    text: "Create Account",
                    onPressed: registerViewModel.register,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have an account",
                        style: AppStyles.light16White,
                      ),
                      CustomTextButton(
                        txt: "Login",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.loginRoute);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
