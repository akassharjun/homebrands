import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/product.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
	@override
	FavoriteState get initialState => InitialFavoriteState();
	
	@override
	Stream<FavoriteState> mapEventToState(FavoriteEvent event
	                                      ) async* {
		// TODO: Add your event logic
	}
}
