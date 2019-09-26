part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  SignUpEvent([List props = const []]) : super(props);
}

class RegisterUserEvent extends SignUpEvent {
  final User user;

  RegisterUserEvent(this.user);
}
