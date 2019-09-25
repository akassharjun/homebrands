import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/login/login_bloc.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/clickable_text.dart';
import 'package:homebrands/widgets/flat_button.dart';
import 'package:homebrands/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginBloc = LoginBloc();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kMagenta,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WELCOME BACK!',
                        style: TextStyle(
                          fontSize: ScreenUtil.getTextSize(20),
                          height: ScreenUtil.getHeight(0.05),
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder(
                      bloc: loginBloc,
                      builder: (BuildContext context, LoginState state) {
                        if (state is InitialLoginState) {
                          _buildForm(context);
                        }
                        
                        if (state is NetworkErrorLoginState) {
                          // show alert with state.error
                        }
                        
                        if (state is NetworkBusyLoginState) {
                          // show the loading screen
                        }
                        
                        
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildForm(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ReusableTextField(
            controller: userNameController,
            hintText: 'USERNAME',
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
            height: ScreenUtil.getHeight(3),
          ),
          Button(
            buttonText: 'LOG IN',
            textColor: kMagenta,
            backgroundColor: kWhite,
            onPressed: () {
              Navigator.pushNamed(context, Routes.HOME);
            },
          ),
          SizedBox(
            height: ScreenUtil.getHeight(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClickableText(
                text: 'Sign Up',
                onTap: () {
                  print('clicked sign up');
                  Navigator.pushNamed(context, Routes.SIGN_UP);
                },
              ),
              Text(' or ', style: TextStyle(color: kWhite)),
              ClickableText(
                text: 'Register your Business',
                onTap: () {
                  print('clicked register');
                  Navigator.pushNamed(context, Routes.BUSINESS_REGISTRATION);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
