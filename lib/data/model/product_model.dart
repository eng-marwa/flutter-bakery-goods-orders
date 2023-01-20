import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductResponse {
  int? id;
  String? name;
  List<Ingredients>? ingredients;
  String? type;
  String? image;

  ProductResponse(
      {this.id,
      this.name,
      this.ingredients,
        this.type,
      this.image});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class Ingredients {
  double? quantity;
  String? measure;
  String? ingredient;

  Ingredients({this.quantity, this.measure, this.ingredient});

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}
