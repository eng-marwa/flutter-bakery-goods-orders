import 'package:equatable/equatable.dart';

import 'item.dart';

class Order extends Equatable{
  int? orderId;
  String? orderDate;
  List<Item>? items;
  double? price;
  String? status;
  String? paymentMethod;
  @override
  List<Object?> get props => [orderId, orderDate, items,price,status,paymentMethod];

  Order({required this.orderId, required this.orderDate, required this.items, required this.price, required this.status, required this.paymentMethod});
}