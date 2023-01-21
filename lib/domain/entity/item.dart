import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'item.g.dart';
@JsonSerializable()
@HiveType(typeId: 0)
class Item extends Equatable{
  @HiveField(0)
  int? productId;
  @HiveField(1)
  String? productName;
  @HiveField(2)
  int? quantity;


  @override
  List<Object?> get props => [productId,quantity];

  Item({this.productId, this.productName, this.quantity});
  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

}