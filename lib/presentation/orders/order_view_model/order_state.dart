import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart';

import '../../../utils/constants/constants.dart';
import 'order_status.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const OrderState._();

  const factory OrderState(
      {@Default(empty) String message,
      List<Order>? orders,
      required OrderStatus orderStatus}) = _OrderState;
}
