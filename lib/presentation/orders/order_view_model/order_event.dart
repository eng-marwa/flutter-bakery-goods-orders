import 'package:equatable/equatable.dart';

import '../../../domain/entity/Rate.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class MakeOrderEvent extends OrderEvent{
}
class ViewOrdersEvent extends OrderEvent{
}
class CancelOrderEvent extends OrderEvent{
  final int? orderId;
  const CancelOrderEvent(this.orderId);
}
class RateOrderEvent extends OrderEvent{
  final Rate? rate;
  const RateOrderEvent(this.rate);
}