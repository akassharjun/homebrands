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
    if (event is ValidationLoginCredentials) {
      _mapValidationLoginCredentialsToState(event.username, event.password);
    }
  }

  Stream<LoginState> _mapValidationLoginCredentialsToState(
      String username, String password) async* {
    yield NetworkBusyLoginState();
    try {
      // network call
      NetworkService networkService = NetworkService();
      AuthResponse authResponse =
          await networkService.validateLoginCredentials(username, password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      prefs.setString('bearerToken', authResponse.token);
      prefs.setString('userInfo', authResponse.user.toJson().toString());

      yield SuccessLoginState();
    } catch (error, stacktrace) {
      // handle network call error
      yield NetworkErrorLoginState(error: error.toString());
    }
  }
}
