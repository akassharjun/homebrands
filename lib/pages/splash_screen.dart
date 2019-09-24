import 'package:flutter/material.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/pages/login.dart';
import 'package:homebrands/utils/screen_util.dart';

class SplashScreen extends StatefulWidget {
  static const ROUTE = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, Routes.LOGIN),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);
    return Scaffold(
      backgroundColor: kMagenta,
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: 'logo',
            child: Container(
              height: ScreenUtil.getHeight(20),
              child: Image.asset(
                'assets/images/logo/logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
