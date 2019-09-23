import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
	@override
	LoginState get initialState => InitialLoginState();
	
	@override
	Stream<LoginState> mapEventToState(LoginEvent event
	                                   ) async* {
		// TODO: Add your event logic
	}
}
