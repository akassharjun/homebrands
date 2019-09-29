part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  UserEvent([List props = const []]) : super(props);
}

class FetchUserInformation extends UserEvent {
  final String userId;

  FetchUserInformation(this.userId);
}
