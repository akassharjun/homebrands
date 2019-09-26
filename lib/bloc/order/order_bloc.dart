import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  @override
  OrderState get initialState => InitialOrderState();

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is PlaceOrderEvent) {
      // ORDER obj to be passed
      _mapPlaceOrderToState();
    }
  }

  Stream<OrderState> _mapPlaceOrderToState() async* {}
}
