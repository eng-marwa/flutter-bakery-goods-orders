import 'package:hnflutter_challenge/data/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bakery_model.g.dart';
@JsonSerializable()
class BakeryResponse {
  BakeryResponse({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
    required this.rate,
    required this.type,
    required this.products,
    required this.logo,
  });

  final int? id;
  final String? name;
  final double? lat;
  final double lon;
  final double? rate;
  final String? type;
  final List<ProductResponse> products;
  final String? logo;
  factory BakeryResponse.fromJson(Map<String, dynamic> json) =>
      _$BakeryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BakeryResponseToJson(this);

}