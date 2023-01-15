import 'package:json_annotation/json_annotation.dart';

part 'Bakery.g.dart';

@JsonSerializable()
class BakeryResponse {
  int? id;
  String? name;
  List<Ingredients>? ingredients;
  List<Steps>? steps;
  int? servings;
  String? image;

  BakeryResponse(
      {this.id,
      this.name,
      this.ingredients,
      this.steps,
      this.servings,
      this.image});

  factory BakeryResponse.fromJson(Map<String, dynamic> json) =>
      _$BakeryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BakeryResponseToJson(this);
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

@JsonSerializable()
class Steps {
  int? id;
  String? shortDescription;
  String? description;
  String? videoURL;
  String? thumbnailURL;

  Steps(
      {this.id,
      this.shortDescription,
      this.description,
      this.videoURL,
      this.thumbnailURL});

  factory Steps.fromJson(Map<String, dynamic> json) => _$StepsFromJson(json);

  Map<String, dynamic> toJson() => _$StepsToJson(this);
}
