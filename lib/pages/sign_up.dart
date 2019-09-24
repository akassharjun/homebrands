import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';

class SignupPage extends StatefulWidget {

  static const ROUTE = 'signup';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);
    return Scaffold(
      backgroundColor: kMagenta,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              'SIGN UP WITH US',
              style: TextStyle(
                fontSize: ScreenUtil.getTextSize(20),
                height: 0.7,
                fontWeight: FontWeight.w700,
              )
            )
          ],
        ),
      ),
    );
  }
}
