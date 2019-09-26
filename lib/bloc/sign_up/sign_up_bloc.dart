import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/user.dart';
import 'package:homebrands/services/network_service.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  @override
  SignUpState get initialState => InitialSignUpState();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is RegisterUserEvent) {
      _mapUserSignUpToState(event.user);
    }
  }

  Stream<SignUpState> _mapUserSignUpToState(User user) async* {
    yield NetworkBusySignUpState();
    try {
      // network call
      NetworkService networkService = NetworkService();
      NewUser newUser = await networkService.registerUser(user);
      yield RegistrationCompleteSignUpState();
    } catch (error, stacktrace) {
      yield NetworkErrorSignUpState(error: error.toString());
    }
  }
}
