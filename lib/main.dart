import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homebrands/pages/dashboard.dart';
import 'package:homebrands/router.dart' as router;
import 'package:homebrands/utils/theme_data.dart';
import 'pages/splash_screen.dart';

import 'bloc/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kWhite,
        fontFamily: 'AirbnbCereal',
        brightness: Brightness.light,
      ),
      initialRoute: SplashScreen.ROUTE,
      onGenerateRoute: router.generateRoute,
    );
  }
}
