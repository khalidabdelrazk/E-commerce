import 'package:bloc/bloc.dart';
import 'package:ecommerce/presentation/authentication/Features/auth/register.dart';
import 'package:flutter/material.dart';
import 'core/di/di.dart';
import 'core/utils/app_route_names.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: Routes.routes,
      initialRoute: AppRoutes.loginRoute,
      home: Register(),
    );
  }
}

