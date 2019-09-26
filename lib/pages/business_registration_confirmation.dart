import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';

class BusinessRegistrationConfirmationPage extends StatelessWidget {

  static String routeID = 'registration_confirmation_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMagenta,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'THANK YOU FOR REGISTERING',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ScreenUtil.getTextSize(20),
                  height: 0.7,
                  color: kWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We will get back to you in 1-2 business days',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 
                ScreenUtil.getHeight(10),
              ),
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: kWhite,
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, Routes.LOGIN);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

