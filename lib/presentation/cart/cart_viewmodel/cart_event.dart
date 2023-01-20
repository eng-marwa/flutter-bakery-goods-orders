import 'package:equatable/equatable.dart';
import 'package:hnflutter_challenge/domain/entity/item.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddItemToCartEvent extends CartEvent {
  final Item item;
  const AddItemToCartEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class DeleteItemFromCartEvent extends CartEvent {
  final int itemId;
  const DeleteItemFromCartEvent(this.itemId);
  @override
  List<Object?> get props => [itemId];
}

class ViewItemsFromCartEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}
class DeleteAllItemsEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}
