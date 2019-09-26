part of 'shop_list_bloc.dart';

@immutable
abstract class ShopListState extends Equatable {
  ShopListState([List props = const []]) : super(props);
}

class InitialShopListState extends ShopListState {}

class NetworkBusyShopListState extends ShopListState {
  @override
  String toString() => 'NetworkBusyShopListState';
}

class NetworkErrorShopListState extends ShopListState {
  final String error;

  NetworkErrorShopListState({this.error});

  @override
  String toString() => 'NetworkErrorShopListState';
}

class ShopListFetchedShopListState extends ShopListState {
  final List<Shop> shopList;

  ShopListFetchedShopListState({this.shopList});

  @override
  String toString() => 'ShopListFetchedShopListState';
}
