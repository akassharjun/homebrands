part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState extends Equatable {
  SignUpState([List props = const []]) : super(props);
}

class InitialSignUpState extends SignUpState {}

class NetworkBusySignUpState extends SignUpState {}

class NetworkErrorSignUpState extends SignUpState {
  final String error;

  NetworkErrorSignUpState({this.error});

  @override
  String toString() => 'NetworkErrorSignUpState';
}

class RegistrationCompleteSignUpState extends SignUpState {}
