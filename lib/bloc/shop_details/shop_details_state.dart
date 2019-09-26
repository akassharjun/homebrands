part of 'shop_details_bloc.dart';

@immutable
abstract class ShopDetailsState extends Equatable {
  ShopDetailsState([List props = const []]) : super(props);
}

class InitialShopDetailsState extends ShopDetailsState {
  @override
  String toString() => 'InitialShopDetailsState';
}

class NetworkBusyShopDetailsState extends ShopDetailsState {
  @override
  String toString() => 'NetworkBusyShopDetailsState';
}

class NetworkErrorShopDetailsState extends ShopDetailsState {
  final String error;

  NetworkErrorShopDetailsState({this.error});

  @override
  String toString() => 'NetworkErrorShopDetailsState';
}

class ProductListFetchedState extends ShopDetailsState {
  final List<Product> productList;

  ProductListFetchedState({this.productList});

  @override
  String toString() => 'ProductListFetchedState';
}
