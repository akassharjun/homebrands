part of 'shop_details_bloc.dart';

@immutable
abstract class ShopDetailsEvent extends Equatable {
  ShopDetailsEvent([List props = const []]) : super(props);
}

class FetchProductList extends ShopDetailsEvent {
  final String shopId;

  FetchProductList(this.shopId);
}