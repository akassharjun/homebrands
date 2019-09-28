import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/services/network_service.dart';
import 'package:meta/meta.dart';

part 'shop_list_event.dart';

part 'shop_list_state.dart';

class ShopListBloc extends Bloc<ShopListEvent, ShopListState> {
  @override
  ShopListState get initialState => InitialShopListState();

  @override
  Stream<ShopListState> mapEventToState(ShopListEvent event) async* {
    if (event is FetchShopList) {
      yield* _mapShopListToState(event.categoryName);
    }
  }

  Stream<ShopListState> _mapShopListToState(String categoryName) async* {
    yield NetworkBusyShopListState();
    try {
      // network call
      NetworkService networkService = NetworkService();
      ShopList shopList =
          await networkService.getShopsByCategoryName(categoryName);
      yield ShopListFetchedShopListState(shopList: shopList.shopList);
    } catch (error, stacktrace) {
      yield NetworkErrorShopListState(error: error.toString());
//      yield ShopListFetchedShopListState();
    }
  }
}
