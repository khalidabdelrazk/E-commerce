import 'package:ecommerce/presentation/authentication/Features/auth/register.dart';
import 'package:ecommerce/presentation/authentication/Features/auth/login.dart';
import 'package:flutter/cupertino.dart';

import 'app_routes.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.loginRoute : (_) => Login(),
    AppRoutes.registerRoute : (_) => Register(),
  };
}
