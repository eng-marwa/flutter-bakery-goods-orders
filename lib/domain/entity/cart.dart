import 'package:equatable/equatable.dart';

import 'item.dart';

class Cart extends Equatable{
  List<Item>? items;
  double? total;

  @override
  List<Object?> get props => [items,double];

}