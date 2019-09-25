import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/text_field.dart';
import 'package:homebrands/widgets/flat_button.dart';
import 'package:homebrands/widgets/clickable_text.dart';

class BusinessRegistrationPage extends StatefulWidget {
  @override
  _BusinessRegistrationPageState createState() => _BusinessRegistrationPageState();
}

class _BusinessRegistrationPageState extends State<BusinessRegistrationPage> {

  TextEditingController sellerNameController = new TextEditingController();
  TextEditingController businessNameController = new TextEditingController();
  TextEditingController paymentMethodController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                    'REGISTER YOUR BUSINESS TODAY!',
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
//                        //Displaying dropdown menu / Cupertino picker according to the platform
//                        Platform.isAndroid ? androidCategoryMenu() : iosCategoryPicker(),

                      //TODO: add drop down menu for category selection
                        ReusableTextField(
                          controller: sellerNameController,
                          hintText: 'SELLER NAME',
                          color: kWhite,
                          obscureText: false,
                        ),
                        ReusableTextField(
                          controller: businessNameController,
                          hintText: 'BUSINESS NAME',
                          color: kWhite,
                          obscureText: false,
                        ),

                        ReusableTextField(
                          controller: paymentMethodController,
                          hintText: 'PAYMENT METHOD',
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
                        SizedBox(
                          height: 40,
                        ),
                        Button(
                          buttonText: 'REGISTER BUSINESS',
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
                              text: 'Sign Up',
                              onTap: (){
                                print('clicked register');
                                Navigator.pushNamed(context, Routes.SIGN_UP);
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
