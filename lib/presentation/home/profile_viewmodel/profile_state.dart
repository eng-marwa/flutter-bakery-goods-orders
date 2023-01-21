import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/view_profile_status.dart';


import '../../../utils/constants/constants.dart';

part 'profile_state.freezed.dart';

@freezed
class ViewProfileState with _$ViewProfileState {
  const ViewProfileState._();

  const factory ViewProfileState(
      {@Default(empty) String message,
      Bakery? bakery,
      required ViewProfileStatus viewProfileStatus}) = _ViewProfileState;
}
