part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {
  DashboardEvent([List props = const []]) : super(props);
}

class FetchFeaturedProducts extends DashboardEvent {}

class FetchTrendingShops extends DashboardEvent {}
