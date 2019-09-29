import 'package:flutter/material.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/pages/business_profile_screen.dart';
import 'package:homebrands/pages/favourites.dart';
import 'package:homebrands/pages/home.dart';
import 'package:homebrands/pages/login.dart';
import 'package:homebrands/pages/user_profile.dart';
import 'pages/sign_up.dart';
import 'pages/business_registration.dart';
import 'pages/business_registration_confirmation.dart';
import 'pages/login.dart';
import 'pages/splash_screen.dart';
import 'pages/shop_details.dart';
import 'pages/product_details.dart';

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
    case Routes.BUSINESS_REGISTRATION_CONFIRMATION:
      return MaterialPageRoute(
        builder: (context) => BusinessRegistrationConfirmationPage(),
      );
    case Routes.PRODUCT_DETAILS:
      return MaterialPageRoute(
        builder: (context) => ProductDetailPage(),
    );
    case Routes.FAVOURITES:
      return MaterialPageRoute(
        builder: (context) => FavouritesPage(),
    );
    case Routes.SHOP_DETAILS:
      return MaterialPageRoute(
        builder: (context) => ShopPage(),
      );
    case Routes.USER_PROFILE:
      return MaterialPageRoute(
        builder: (context) => UserProfilePage(),
      );
    case Routes.BUSINESS_PROFILE:
      return MaterialPageRoute(
        builder: (context) => BusinessProfile(),
      );
    case Routes.BUSINESS_PROFILE:
      return MaterialPageRoute(
        builder: (context) => BusinessProfile(),
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
