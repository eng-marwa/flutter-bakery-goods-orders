// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      orderId: json['orderId'] as int?,
      orderDate: json['orderDate'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toDouble(),
      status: json['status'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      paymentMethod: json['paymentMethod'] as String?,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderDate': instance.orderDate,
      'items': instance.items,
      'price': instance.price,
      'status': instance.status,
      'rate': instance.rate,
      'paymentMethod': instance.paymentMethod,
    };
