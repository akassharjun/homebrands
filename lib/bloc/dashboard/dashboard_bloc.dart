import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/services/network_service.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  @override
  DashboardState get initialState => InitialDashboardState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is FetchFeaturedShops) {
      yield* _mapFetchFeaturedProductsToState();
    }
    if (event is FetchTrendingShops) {
      yield* _mapFetchTrendingShopsToState();
    }
  }

  Stream<DashboardState> _mapFetchFeaturedProductsToState() async* {
    yield NetworkBusyFetchingFeaturedShopsDashboardState();
    try {
      // network call
      NetworkService networkService = NetworkService();
      ShopList shops = await networkService.getFeaturedShops();
      yield FeaturedProductsFetchedDashboardState(shopList: shops.shopList);
    } catch (error, stacktrace) {
      // handle network call error
      yield NetworkErrorFetchingFeaturedShopsDashboardState(error: error.toString());
    }
  }

  Stream<DashboardState> _mapFetchTrendingShopsToState() async* {
    yield NetworkBusyFetchingTrendingShopsDashboardState();
    try {
      // network call
      NetworkService networkService = NetworkService();
      ShopList shops = await networkService.getShops();
      yield TrendingShopsFetchedDashboardState(shopList: shops.shopList);
    } catch (error, stacktrace) {
      // handle network call error
      yield NetworkErrorFetchingTrendingShopsDashboardState(error: error.toString());
    }
  }
}
