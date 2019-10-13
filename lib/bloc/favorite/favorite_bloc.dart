import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/product.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavouritesBloc extends Bloc<FavoriteEvent, FavouriteState> {
	@override
	FavouriteState get initialState => InitialFavouriteState();
	
	@override
	Stream<FavouriteState> mapEventToState(FavoriteEvent event
	                                      ) async* {
		// TODO: Add your event logic
	}
}
