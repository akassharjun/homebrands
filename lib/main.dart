import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homebrands/pages/home.dart';
import 'package:homebrands/router.dart' as router;
import 'package:homebrands/utils/theme_data.dart';
import 'pages/clean/splash_screen.dart';
import 'constants.dart';
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
        primaryColor: kMagenta,
        fontFamily: 'AirbnbCereal',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        bottomAppBarColor: Colors.white,
        canvasColor: Colors.white,
      ),
      initialRoute: Routes.SPLASH,
      onGenerateRoute: router.generateRoute,
    );
  }
}
