part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class ValidationLoginCredentials extends LoginEvent {
  final String username;
  final String password;

  ValidationLoginCredentials(this.username, this.password);
}

class CheckIfUserIsAlreadyLoggedIn extends LoginEvent {

}
