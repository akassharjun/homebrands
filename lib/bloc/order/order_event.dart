part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {
  OrderEvent([List props = const []]) : super(props);
}

class PlaceOrderEvent extends OrderEvent {}
