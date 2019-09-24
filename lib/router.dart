import 'package:flutter/material.dart';
import 'package:homebrands/pages/dashboard.dart';
import 'pages/splash_screen.dart';
import 'pages/login.dart';
import 'pages/sign_up.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
	switch (settings.name) {
		case DashboardPage.ROUTE:
			return MaterialPageRoute(
				builder: (context) => DashboardPage(),
			);
		case SplashScreen.ROUTE:
			return MaterialPageRoute(
				builder: (context) => SplashScreen(),
			);
		case LoginPage.ROUTE:
			return MaterialPageRoute(
				builder: (context) => SplashScreen(),
			);
		case SignupPage.ROUTE:
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
