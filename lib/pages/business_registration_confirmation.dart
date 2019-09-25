import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';

class RegistrationConfirmation extends StatelessWidget {

  static String routeID = 'registration_confirmation_screen';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'THANK YOU FOR REGISTERING',
          textAlign: TextAlign.center,
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
        FlatButton(
          child: Text(
            'OK'
          ),
          onPressed: (){
            Navigator.pushNamed(context, Routes.LOGIN);
          },
        )
      ],
    );
  }
}

