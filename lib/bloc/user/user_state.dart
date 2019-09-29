part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class InitialUserState extends UserState {}

class NetworkBusyUserState extends UserState {}

class NetworkErrorUserState extends UserState {
  final String error;

  NetworkErrorUserState({this.error});

  @override
  String toString() => 'NetworkErrorUserState';
}

class FetchedUserInformationUserState extends UserState {
  final User user;

  FetchedUserInformationUserState(this.user);
}
