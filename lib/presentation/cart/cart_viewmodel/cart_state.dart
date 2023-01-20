import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hnflutter_challenge/domain/entity/item.dart';

import '../../../utils/constants/constants.dart';
import '../CartStatus.dart';
part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({@Default(empty) String message,
    ValueListenable<Box<Item>>? items,
    required CartStatus status}) = _CartState;
}


