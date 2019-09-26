import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/sign_up/sign_up_bloc.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/model/user.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/clickable_text.dart';
import 'package:homebrands/widgets/flat_button.dart';
import 'package:homebrands/widgets/text_field.dart';

class SignUpPage extends StatefulWidget {
  static const ROUTE = 'signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signUpBloc = SignUpBloc();

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
                    child: BlocListener(
                      bloc: signUpBloc,
                      listener: (BuildContext context, SignUpState state) {
                        if (state is RegistrationCompleteSignUpState) {
                          Navigator.of(context).pushNamed(Routes.HOME);
                        }
                      },
                      child: BlocBuilder(
                        bloc: signUpBloc,
                        builder: (BuildContext context, SignUpState state) {
                          if (state is InitialSignUpState) {
                            _buildRegistrationForm(context);
                          }

                          if (state is NetworkErrorSignUpState) {
                            // show error
                          }

                          if (state is NetworkBusySignUpState) {
                            // return circular progress indicator
                          }

                          return Container();
                        },
                      ),
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

  Column _buildRegistrationForm(BuildContext context) {
    return Column(
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
          onPressed: () {
            User user = User(
              fullName: fullNameController.text,
              password: passwordController.text,
              email: emailController.text,
              username: userNameController.text,
              phone: '',
              birthDay: DateTime.now(),
              gender: 'male',
            );
            signUpBloc.dispatch(RegisterUserEvent(user));
          },
        ),
        SizedBox(
          height: ScreenUtil.getHeight(1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('or ', style: TextStyle(color: kWhite)),
            ClickableText(
              text: 'Register your Business',
              onTap: () {
                print('clicked register');
                Navigator.pushNamed(context, Routes.BUSINESS_REGISTRATION);
              },
            ),
          ],
        ),
      ],
    );
  }
}
