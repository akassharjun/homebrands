import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/text_field.dart';
import 'package:homebrands/widgets/flat_button.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/clickable_text.dart';

class SignUpPage extends StatefulWidget {

  static const ROUTE = 'signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController fullNameController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController paymentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);
    
    return Scaffold(
      backgroundColor: kMagenta,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'JOIN US!',
                    style: TextStyle(
                      fontSize: ScreenUtil.getTextSize(20),
                      height: 0.7,
                      color: kWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        ReusableTextField(
                          controller: fullNameController,
                          hintText: 'FULL NAME',
                          color: kWhite,
                          obscureText: false,
                        ),
                        ReusableTextField(
                          controller: userNameController,
                          hintText: 'USERNAME',
                          color: kWhite,
                          obscureText: false,
                        ),
                        ReusableTextField(
                          controller: emailController,
                          hintText: 'EMAIL',
                          color: kWhite,
                          obscureText: false,
                        ),
                        ReusableTextField(
                          controller: passwordController,
                          hintText: 'PASSWORD',
                          color: kWhite,
                          obscureText: true,
                        ),
                        ReusableTextField(
                          controller: paymentController,
                          hintText: 'PAYMENT METHOD',
                          color: kWhite,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getHeight(5),
                        ),
                        Button(
                          buttonText: 'SIGN UP',
                          textColor: kMagenta,
                          backgroundColor: kWhite,
                          onPressed: (){Navigator.pushNamed(context, Routes.HOME);},
                        ),
                        SizedBox(
                          height: ScreenUtil.getHeight(1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                            'or ',
                              style: TextStyle(
                                  color: kWhite
                              )
                            ),
                            ClickableText(
                              text: 'Register your Business',
                              onTap: (){
                                print('clicked register');
                                Navigator.pushNamed(context, Routes.BUSINESS_REGISTRATION);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
