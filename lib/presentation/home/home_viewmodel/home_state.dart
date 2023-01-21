import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';


import '../../../utils/constants/constants.dart';
import 'view_bakeries_status.dart';

part 'home_state.freezed.dart';

@freezed
class ViewBakeriesState with _$ViewBakeriesState {
  const ViewBakeriesState._();

  const factory ViewBakeriesState(
      {@Default(empty) String message,
      List<Bakery>? bakeries,
      required ViewBakeriesStatus viewBakeriesStatus}) = _ViewBakeriesState;
}
