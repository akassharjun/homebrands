import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/login/login_bloc.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/alert_box.dart';
import 'package:homebrands/widgets/clickable_text.dart';
import 'package:homebrands/widgets/flat_button.dart';
import 'package:homebrands/widgets/progress_indicator.dart';
import 'package:homebrands/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc loginBloc = new LoginBloc();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
//    loginBloc.dispatch(ValidationLoginCredentials("sureshm", "1234"));
    loginBloc.dispatch(CheckIfUserIsAlreadyLoggedIn());
    super.initState();
  }

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
                    BlocListener(
                      bloc: loginBloc,
                      listener: (BuildContext context, LoginState state) {
                        if (state is SuccessLoginState) {
                          Navigator.of(context).pushNamed(Routes.HOME);
                        }
                        if (state is UserAlreadyLoggedInState) {
                          Navigator.of(context).pushNamed(Routes.HOME);
                        }
                      },
                      child: BlocBuilder(
                        bloc: loginBloc,
                        builder: (BuildContext context, LoginState state) {
                          if (state is InitialLoginState) {
                            return _buildForm(context);
                          }

                          if (state is NetworkErrorLoginState) {
                            ErrorDialog.getAlertBox(
                                context: context,
                                onPressed: () {
//                                  categoryBloc.dispatch(FetchCategoryList());
                                },
                                title: "ERROR",
                                message: state.error,
                                flatButtonText: "OK");
                            return _buildForm(context);
                          }

                          if (state is NetworkBusyLoginState) {
                            return LoadingWidget();
                          }
                          return Container();
                        },
                      ),
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
              loginBloc.dispatch(ValidationLoginCredentials(
                  userNameController.text, passwordController.text));
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
//              Text(' or ', style: TextStyle(color: kWhite)),
//              ClickableText(
//                text: 'Register your Business',
//                onTap: () {
//                  print('clicked register');
//                  Navigator.pushNamed(context, Routes.BUSINESS_REGISTRATION);
//                },
//              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    loginBloc.dispose();
    super.dispose();
  }
}
