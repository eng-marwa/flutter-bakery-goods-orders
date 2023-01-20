// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ingredients': instance.ingredients,
      'type': instance.type,
      'image': instance.image,
    };

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      quantity: (json['quantity'] as num?)?.toDouble(),
      measure: json['measure'] as String?,
      ingredient: json['ingredient'] as String?,
    );

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'measure': instance.measure,
      'ingredient': instance.ingredient,
    };
