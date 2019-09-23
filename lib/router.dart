import 'package:flutter/material.dart';
import 'package:homebrands/pages/dashboard.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
	switch (settings.name) {
		case DashboardPage.ROUTE:
			return MaterialPageRoute(
				builder: (context) => DashboardPage(),
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
