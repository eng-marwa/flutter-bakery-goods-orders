// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewProfileState {
  String get message => throw _privateConstructorUsedError;
  Bakery? get bakery => throw _privateConstructorUsedError;
  ViewProfileStatus get viewProfileStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewProfileStateCopyWith<ViewProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewProfileStateCopyWith<$Res> {
  factory $ViewProfileStateCopyWith(
          ViewProfileState value, $Res Function(ViewProfileState) then) =
      _$ViewProfileStateCopyWithImpl<$Res, ViewProfileState>;
  @useResult
  $Res call(
      {String message, Bakery? bakery, ViewProfileStatus viewProfileStatus});
}

/// @nodoc
class _$ViewProfileStateCopyWithImpl<$Res, $Val extends ViewProfileState>
    implements $ViewProfileStateCopyWith<$Res> {
  _$ViewProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? bakery = freezed,
    Object? viewProfileStatus = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      bakery: freezed == bakery
          ? _value.bakery
          : bakery // ignore: cast_nullable_to_non_nullable
              as Bakery?,
      viewProfileStatus: null == viewProfileStatus
          ? _value.viewProfileStatus
          : viewProfileStatus // ignore: cast_nullable_to_non_nullable
              as ViewProfileStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewProfileStateCopyWith<$Res>
    implements $ViewProfileStateCopyWith<$Res> {
  factory _$$_ViewProfileStateCopyWith(
          _$_ViewProfileState value, $Res Function(_$_ViewProfileState) then) =
      __$$_ViewProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, Bakery? bakery, ViewProfileStatus viewProfileStatus});
}

/// @nodoc
class __$$_ViewProfileStateCopyWithImpl<$Res>
    extends _$ViewProfileStateCopyWithImpl<$Res, _$_ViewProfileState>
    implements _$$_ViewProfileStateCopyWith<$Res> {
  __$$_ViewProfileStateCopyWithImpl(
      _$_ViewProfileState _value, $Res Function(_$_ViewProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? bakery = freezed,
    Object? viewProfileStatus = null,
  }) {
    return _then(_$_ViewProfileState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      bakery: freezed == bakery
          ? _value.bakery
          : bakery // ignore: cast_nullable_to_non_nullable
              as Bakery?,
      viewProfileStatus: null == viewProfileStatus
          ? _value.viewProfileStatus
          : viewProfileStatus // ignore: cast_nullable_to_non_nullable
              as ViewProfileStatus,
    ));
  }
}

/// @nodoc

class _$_ViewProfileState extends _ViewProfileState {
  const _$_ViewProfileState(
      {this.message = empty, this.bakery, required this.viewProfileStatus})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final Bakery? bakery;
  @override
  final ViewProfileStatus viewProfileStatus;

  @override
  String toString() {
    return 'ViewProfileState(message: $message, bakery: $bakery, viewProfileStatus: $viewProfileStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewProfileState &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.bakery, bakery) || other.bakery == bakery) &&
            (identical(other.viewProfileStatus, viewProfileStatus) ||
                other.viewProfileStatus == viewProfileStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, bakery, viewProfileStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewProfileStateCopyWith<_$_ViewProfileState> get copyWith =>
      __$$_ViewProfileStateCopyWithImpl<_$_ViewProfileState>(this, _$identity);
}

abstract class _ViewProfileState extends ViewProfileState {
  const factory _ViewProfileState(
          {final String message,
          final Bakery? bakery,
          required final ViewProfileStatus viewProfileStatus}) =
      _$_ViewProfileState;
  const _ViewProfileState._() : super._();

  @override
  String get message;
  @override
  Bakery? get bakery;
  @override
  ViewProfileStatus get viewProfileStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ViewProfileStateCopyWith<_$_ViewProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
