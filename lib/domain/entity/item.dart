import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'item.g.dart';

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


}