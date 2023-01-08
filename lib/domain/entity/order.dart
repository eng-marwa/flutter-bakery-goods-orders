import 'package:equatable/equatable.dart';

import 'item.dart';

class Order extends Equatable{
  List<Item>? items;
  double? price;
  double? paid;
  String? status;
  String? paymentMethod;
  @override
  List<Object?> get props => [items,price,paid,status,paymentMethod];

}