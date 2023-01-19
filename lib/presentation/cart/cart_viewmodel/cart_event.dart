import 'package:equatable/equatable.dart';

abstract class CartEvent {}

class AddItemToCartEvent extends CartEvent {}

class DeleteItemFromCartEvent extends CartEvent {}

class ViewItemsFromCartEvent extends CartEvent {}
