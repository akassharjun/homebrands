import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/user.dart';
import 'package:homebrands/services/network_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print("Im here");
    if (event is ValidationLoginCredentials) {
      yield* _mapValidationLoginCredentialsToState(
          event.username, event.password);
    }
    if (event is CheckIfUserIsAlreadyLoggedIn) {
      yield* _mapCheckIfUserIsAlreadyLoggedInToState(
         );
    }
  }
  
  Stream<LoginState> _mapCheckIfUserIsAlreadyLoggedInToState(
      ) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasUserLoggedIn = prefs.getBool('signedIn');
    
    if (hasUserLoggedIn) {
      yield UserAlreadyLoggedInState();
    } else {
      yield InitialLoginState();
    }
  
  }

  Stream<LoginState> _mapValidationLoginCredentialsToState(
      String username, String password) async* {
    print("hello");
    yield NetworkBusyLoginState();
    try {
      // network call
      NetworkService networkService = NetworkService();
      AuthResponse authResponse =
          await networkService.validateLoginCredentials(username, password);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      print("HI");
      prefs.setString('bearerToken', authResponse.token);
      prefs.setString('userInfo', authResponse.user.toJson().toString());
      prefs.setBool('signedIn', true);

      yield SuccessLoginState();
    } catch (error, stacktrace) {
      // handle network call error
      NetworkException exception = error;
      yield NetworkErrorLoginState(error: exception.cause.toString());
    }
  }
}
