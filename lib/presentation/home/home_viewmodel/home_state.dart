import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';

import '../../../utils/constants/constants.dart';
import '../view_product_status.dart';

part 'home_state.freezed.dart';

@freezed
class ViewProductsState with _$ViewProductsState {
  const ViewProductsState._();

  const factory ViewProductsState(
      {@Default(empty) String message,
      List<Product>? products,
      required ViewProductsStatus viewProductStatus}) = _ViewProductsState;
}
