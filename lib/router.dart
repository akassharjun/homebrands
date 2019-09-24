import 'package:flutter/material.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/pages/dashboard.dart';
import 'package:homebrands/pages/login.dart';

import 'pages/login.dart';
import 'pages/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.HOME:
      return MaterialPageRoute(
        builder: (context) => DashboardPage(),
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
        builder: (context) => SplashScreen(),
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
