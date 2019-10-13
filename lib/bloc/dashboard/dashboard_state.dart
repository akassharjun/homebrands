part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable {
  DashboardState([List props = const []]) : super(props);
}

class InitialDashboardState extends DashboardState {}

class NetworkBusyFetchingFeaturedShopsDashboardState extends DashboardState {
  @override
  String toString() => 'NetworkBusyDashboardState';
}

class NetworkBusyFetchingTrendingShopsDashboardState extends DashboardState {
  @override
  String toString() => 'NetworkBusyDashboardState';
}

class NetworkErrorFetchingFeaturedShopsDashboardState extends DashboardState {
  final String error;

  NetworkErrorFetchingFeaturedShopsDashboardState({this.error});

  @override
  String toString() => 'NetworkErrorFetchingProductsDashboardState';
}

class NetworkErrorFetchingTrendingShopsDashboardState extends DashboardState {
  final String error;

  NetworkErrorFetchingTrendingShopsDashboardState({this.error});

  @override
  String toString() => 'NetworkErrorFetchingShopsDashboardState';
}

class FeaturedProductsFetchedDashboardState extends DashboardState {
  final List<Shop> shopList;

  FeaturedProductsFetchedDashboardState({this.shopList = const []})
      : super([shopList]);

  bool get hasData => shopList.length > 0;

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
