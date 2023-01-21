import 'package:hnflutter_challenge/data/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/item.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderResponse {
  OrderResponse({
    required this.orderId,
    required this.orderDate,
    required this.items,
    required this.price,
    required this.status,
    required this.rate,
    required this.paymentMethod,
  });
  int? orderId;
  String? orderDate;
  List<Item>? items;
  double? price;
  String? status;
  double? rate;
  String? paymentMethod;

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

}