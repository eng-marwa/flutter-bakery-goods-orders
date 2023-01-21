// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewBakeriesState {
  String get message => throw _privateConstructorUsedError;
  List<Bakery>? get bakeries => throw _privateConstructorUsedError;
  ViewBakeriesStatus get viewBakeriesStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewBakeriesStateCopyWith<ViewBakeriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewBakeriesStateCopyWith<$Res> {
  factory $ViewBakeriesStateCopyWith(
          ViewBakeriesState value, $Res Function(ViewBakeriesState) then) =
      _$ViewBakeriesStateCopyWithImpl<$Res, ViewBakeriesState>;
  @useResult
  $Res call(
      {String message,
      List<Bakery>? bakeries,
      ViewBakeriesStatus viewBakeriesStatus});
}

/// @nodoc
class _$ViewBakeriesStateCopyWithImpl<$Res, $Val extends ViewBakeriesState>
    implements $ViewBakeriesStateCopyWith<$Res> {
  _$ViewBakeriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? bakeries = freezed,
    Object? viewBakeriesStatus = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      bakeries: freezed == bakeries
          ? _value.bakeries
          : bakeries // ignore: cast_nullable_to_non_nullable
              as List<Bakery>?,
      viewBakeriesStatus: null == viewBakeriesStatus
          ? _value.viewBakeriesStatus
          : viewBakeriesStatus // ignore: cast_nullable_to_non_nullable
              as ViewBakeriesStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewBakeriesStateCopyWith<$Res>
    implements $ViewBakeriesStateCopyWith<$Res> {
  factory _$$_ViewBakeriesStateCopyWith(_$_ViewBakeriesState value,
          $Res Function(_$_ViewBakeriesState) then) =
      __$$_ViewBakeriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      List<Bakery>? bakeries,
      ViewBakeriesStatus viewBakeriesStatus});
}

/// @nodoc
class __$$_ViewBakeriesStateCopyWithImpl<$Res>
    extends _$ViewBakeriesStateCopyWithImpl<$Res, _$_ViewBakeriesState>
    implements _$$_ViewBakeriesStateCopyWith<$Res> {
  __$$_ViewBakeriesStateCopyWithImpl(
      _$_ViewBakeriesState _value, $Res Function(_$_ViewBakeriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? bakeries = freezed,
    Object? viewBakeriesStatus = null,
  }) {
    return _then(_$_ViewBakeriesState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      bakeries: freezed == bakeries
          ? _value._bakeries
          : bakeries // ignore: cast_nullable_to_non_nullable
              as List<Bakery>?,
      viewBakeriesStatus: null == viewBakeriesStatus
          ? _value.viewBakeriesStatus
          : viewBakeriesStatus // ignore: cast_nullable_to_non_nullable
              as ViewBakeriesStatus,
    ));
  }
}

/// @nodoc

class _$_ViewBakeriesState extends _ViewBakeriesState {
  const _$_ViewBakeriesState(
      {this.message = empty,
      final List<Bakery>? bakeries,
      required this.viewBakeriesStatus})
      : _bakeries = bakeries,
        super._();

  @override
  @JsonKey()
  final String message;
  final List<Bakery>? _bakeries;
  @override
  List<Bakery>? get bakeries {
    final value = _bakeries;
    if (value == null) return null;
    if (_bakeries is EqualUnmodifiableListView) return _bakeries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ViewBakeriesStatus viewBakeriesStatus;

  @override
  String toString() {
    return 'ViewBakeriesState(message: $message, bakeries: $bakeries, viewBakeriesStatus: $viewBakeriesStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewBakeriesState &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._bakeries, _bakeries) &&
            (identical(other.viewBakeriesStatus, viewBakeriesStatus) ||
                other.viewBakeriesStatus == viewBakeriesStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_bakeries), viewBakeriesStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewBakeriesStateCopyWith<_$_ViewBakeriesState> get copyWith =>
      __$$_ViewBakeriesStateCopyWithImpl<_$_ViewBakeriesState>(
          this, _$identity);
}

abstract class _ViewBakeriesState extends ViewBakeriesState {
  const factory _ViewBakeriesState(
          {final String message,
          final List<Bakery>? bakeries,
          required final ViewBakeriesStatus viewBakeriesStatus}) =
      _$_ViewBakeriesState;
  const _ViewBakeriesState._() : super._();

  @override
  String get message;
  @override
  List<Bakery>? get bakeries;
  @override
  ViewBakeriesStatus get viewBakeriesStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ViewBakeriesStateCopyWith<_$_ViewBakeriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
