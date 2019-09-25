import 'package:flutter/material.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/pages/home.dart';
import 'package:homebrands/pages/login.dart';
import 'pages/sign_up.dart';
import 'pages/business_registration.dart';

import 'pages/login.dart';
import 'pages/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.HOME:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    case Routes.SPLASH:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );
    case Routes.LOGIN:
      return MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
    case Routes.SIGN_UP:
      return MaterialPageRoute(
        builder: (context) => SignUpPage(),
      );
    case Routes.BUSINESS_REGISTRATION:
      return MaterialPageRoute(
        builder: (context) => BusinessRegistrationPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
