import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';

import '../../../utils/constants/constants.dart';
import '../view_product_status.dart';

part 'home_state.freezed.dart';

@freezed
class ViewProductState with _$ViewProductState {
  const ViewProductState._();

  const factory ViewProductState(
      {@Default(empty) String message,
      List<Product>? products,
      required ViewProductStatus viewProductStatus}) = _ViewProductState;
}
