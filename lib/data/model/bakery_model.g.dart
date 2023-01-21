// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bakery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BakeryResponse _$BakeryResponseFromJson(Map<String, dynamic> json) =>
    BakeryResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num).toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      type: json['type'] as String?,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$BakeryResponseToJson(BakeryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'rate': instance.rate,
      'type': instance.type,
      'products': instance.products,
      'logo': instance.logo,
    };
