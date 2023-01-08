import 'package:equatable/equatable.dart';

class Item extends Equatable{
  String? productId;
  int? quantity;

  @override
  List<Object?> get props => [productId,quantity];


}