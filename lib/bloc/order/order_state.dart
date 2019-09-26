part of 'order_bloc.dart';

@immutable
abstract class OrderState extends Equatable {
  OrderState([List props = const []]) : super(props);
}

class InitialOrderState extends OrderState {}

class NetworkBusyOrderState extends OrderState {}

class NetworkErrorOrderState extends OrderState {}

class OrderPlacedOrderState extends OrderState {}
