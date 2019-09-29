import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/services/network_service.dart';
import 'package:meta/meta.dart';

part 'shop_details_event.dart';

part 'shop_details_state.dart';

class ShopDetailsBloc extends Bloc<ShopDetailsEvent, ShopDetailsState> {
  @override
  ShopDetailsState get initialState => InitialShopDetailsState();

  @override
  Stream<ShopDetailsState> mapEventToState(ShopDetailsEvent event) async* {
    if (event is FetchProductList) {
      yield* _mapFetchProductListToState(event.shopId);
    }
  }

  Stream<ShopDetailsState> _mapFetchProductListToState(String shopId) async* {
    print("I'm here");
    yield NetworkBusyShopDetailsState();
    try {
      // network call
      NetworkService networkService = NetworkService();
      ProductList productList = await networkService.getProductByShopID(shopId);

      yield ProductListFetchedState(productList: productList.items);
    } catch (error, stacktrace) {
      // handle network call error
      NetworkException exception = error;
      yield NetworkErrorShopDetailsState(error: exception.cause.toString());
    }
  }
}
