
import 'package:flutter/material.dart';
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.3,
                  child: Image.asset(AppAssets.appBarLeading),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email", style: AppStyles.light16White),
                      SizedBox(height: height * 0.01),
                      CustomTextField(
                        label: "Email",
                        labelColor: AppColors.iconsColor,
                        controller: _emailController,
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
                        controller: _passwordController,
                        borderColor: AppColors.whiteColor,
                        prefixIcon: Icons.lock_sharp,
                        prefixIconColor: AppColors.iconsColor,
                        // maxLength: 12,
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
                    // Todo: Login validation
                    _formKey.currentState!.validate();
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
    );
  }
}
