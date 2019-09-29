import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/user.dart';
import 'package:homebrands/services/network_service.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUserInformation) {
      yield* _mapFetchUserInformationToState(event.userId);
    }
  }

  Stream<UserState> _mapFetchUserInformationToState(String userID) async* {
    try {
      NetworkService networkService = NetworkService();
      User user = await networkService.getUserById(userID);
      yield FetchedUserInformationUserState(user);
    } catch (error) {
      yield NetworkErrorUserState(error: error.toString());
    }
  }
}
