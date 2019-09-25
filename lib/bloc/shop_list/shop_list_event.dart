part of 'shop_list_bloc.dart';

@immutable
abstract class ShopListEvent extends Equatable {
  ShopListEvent([List props = const []]) : super(props);
}

class FetchShopList extends ShopListEvent {
  final String categoryName;

  FetchShopList(this.categoryName);
}
