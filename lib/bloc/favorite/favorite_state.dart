part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState extends Equatable {
	FavoriteState([List props = const []]) : super(props);
}

class InitialFavoriteState extends FavoriteState {}

class NetworkBusyFavoriteState extends FavoriteState {}

class NetworkErrorFavoriteState extends FavoriteState {}

class FavoriteListFetchedFavoriteState extends FavoriteState {
	final List<Product> productList;

  FavoriteListFetchedFavoriteState(this.productList);
}
