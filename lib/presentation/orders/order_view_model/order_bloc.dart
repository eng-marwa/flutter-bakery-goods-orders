import 'package:bloc/bloc.dart';
import 'package:hnflutter_challenge/presentation/orders/order_view_model/order_event.dart';
import 'package:hnflutter_challenge/presentation/orders/order_view_model/order_state.dart';
import 'package:hnflutter_challenge/presentation/orders/order_view_model/order_status.dart';

import '../../../domain/usecases/member_use_cases/cancel_order_use_case.dart';
import '../../../domain/usecases/member_use_cases/make_order_use_case.dart';
import '../../../domain/usecases/member_use_cases/rate_order_use_case.dart';
import '../../../domain/usecases/member_use_cases/view_member_history.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  MakeOrderUseCase _makeOrderUseCase;
  CancelOrderUseCase _cancelOrderUseCase;
  RateOrderUseCase _rateOrderUseCase;
  ViewMemberOrdersUseCase _memberOrdersUseCase;

  OrderBloc(this._makeOrderUseCase, this._memberOrdersUseCase,
      this._rateOrderUseCase, this._cancelOrderUseCase)
      : super(OrderState(orderStatus: LoadingOrderStatus())) {
    on<MakeOrderEvent>((event, emit) => _createOrder());
    on<CancelOrderEvent>((event, emit) => _cancelOrder(event));
    on<ViewOrdersEvent>((event, emit) => _viewAllOrders());
    on<RateOrderEvent>((event, emit) => _rateOrder(event));
  }

  _createOrder() async {
    emit(state.copyWith(orderStatus: LoadingOrderStatus()));
    try {
      final result = await _makeOrderUseCase.execute(null);
      result.fold(
          (l) => emit(OrderState(orderStatus: FailedOrderStatus(l.message))),
          (r) => emit(OrderState(orderStatus: SuccessCreateOrderStatus())));
    } on Exception catch (e) {
      emit(state.copyWith(orderStatus: FailedOrderStatus(e.toString())));
    }
  }

  _cancelOrder(CancelOrderEvent event) async {
    emit(state.copyWith(orderStatus: LoadingOrderStatus()));
    try {
      final result = await _cancelOrderUseCase.execute(event.orderId);
      result.fold(
          (l) => emit(OrderState(orderStatus: FailedOrderStatus(l.message))),
          (r) => emit(OrderState(
              orders: r, orderStatus: SuccessOrderCancelledStatus())));
    } on Exception catch (e) {
      emit(state.copyWith(orderStatus: FailedOrderStatus(e.toString())));
    }
  }

  _viewAllOrders() async {
    emit(state.copyWith(orderStatus: LoadingOrderStatus()));
    try {
      //suggest token used
      final result = await _memberOrdersUseCase.execute(null);
      result.fold(
          (l) => emit(OrderState(orderStatus: FailedOrderStatus(l.message))),
          (r) => emit(
              OrderState(orders: r, orderStatus: SuccessViewOrdersStatus())));
    } on Exception catch (e) {
      emit(state.copyWith(orderStatus: FailedOrderStatus(e.toString())));
    }
  }

  _rateOrder(RateOrderEvent event) async {
    emit(state.copyWith(orderStatus: LoadingOrderStatus()));
    try {
      final result = await _rateOrderUseCase.execute(event.rate);
      result.fold(
          (l) => emit(OrderState(orderStatus: FailedOrderStatus(l.message))),
          (r) => emit(
              OrderState(orders: r, orderStatus: SuccessOrderRatedStatus())));
    } on Exception catch (e) {
      emit(state.copyWith(orderStatus: FailedOrderStatus(e.toString())));
    }
  }
}
