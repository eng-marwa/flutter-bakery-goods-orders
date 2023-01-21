abstract class OrderStatus{
  const OrderStatus();
}

class LoadingOrderStatus extends OrderStatus{}
class SuccessCreateOrderStatus extends OrderStatus{}
class SuccessViewOrdersStatus extends OrderStatus{}
class SuccessOrderCancelledStatus extends OrderStatus{}
class SuccessOrderRatedStatus extends OrderStatus{}
class FailedOrderStatus extends OrderStatus{
  final String failureMessage;
  FailedOrderStatus(this.failureMessage);
}