import 'package:equatable/equatable.dart';

import 'item.dart';

class Order extends Equatable{
  int? orderId;
  String? orderDate;
  List<Item>? items;
  double? price;
  String? status;
  double? rate=0.0;
  String? paymentMethod;
  @override
  List<Object?> get props => [orderId, orderDate, items,price,status,paymentMethod];

  Order({required this.orderId, required this.orderDate, required this.items, required this.price, required this.status,this.rate, required this.paymentMethod});
}