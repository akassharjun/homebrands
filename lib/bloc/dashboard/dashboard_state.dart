part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable {
  DashboardState([List props = const []]) : super(props);
}

class InitialDashboardState extends DashboardState {}

class NetworkBusyFetchingProductsDashboardState extends DashboardState {
  @override
  String toString() => 'NetworkBusyDashboardState';
}

class NetworkBusyFetchingShopsDashboardState extends DashboardState {
  @override
  String toString() => 'NetworkBusyDashboardState';
}

class NetworkErrorFetchingProductsDashboardState extends DashboardState {
  final String error;

  NetworkErrorFetchingProductsDashboardState({this.error});

  @override
  String toString() => 'NetworkErrorFetchingProductsDashboardState';
}

class NetworkErrorFetchingShopsDashboardState extends DashboardState {
  final String error;

  NetworkErrorFetchingShopsDashboardState({this.error});

  @override
  String toString() => 'NetworkErrorFetchingShopsDashboardState';
}

class FeaturedProductsFetchedDashboardState extends DashboardState {
  final List<Product> productList;

  FeaturedProductsFetchedDashboardState({this.productList = const []})
      : super([productList]);

  bool get hasData => productList.length > 0;

  @override
  String toString() => 'FeaturedProductsDashboardState';
}

class TrendingShopsFetchedDashboardState extends DashboardState {
  final List<Shop> shopList;

  TrendingShopsFetchedDashboardState({this.shopList = const []}) : super([shopList]);

  bool get hasData => shopList.length > 0;

  @override
  String toString() => 'TrendingShopsDashboardState';
}
