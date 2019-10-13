part of 'favorite_bloc.dart';

@immutable
abstract class FavouriteState extends Equatable {
	FavouriteState([List props = const []]) : super(props);
}

class InitialFavouriteState extends FavouriteState {}

class NetworkBusyFavouriteState extends FavouriteState {}

class NetworkErrorFavouriteState extends FavouriteState {}

class FavouriteListFetchedFavouriteState extends FavouriteState {
	final List<Product> productList;

  FavouriteListFetchedFavouriteState(this.productList);
	
	bool get hasData => productList.length > 0;
}
