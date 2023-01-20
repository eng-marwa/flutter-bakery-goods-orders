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
mixin _$ViewProductsState {
  String get message => throw _privateConstructorUsedError;
  List<Product>? get products => throw _privateConstructorUsedError;
  ViewProductsStatus get viewProductStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewProductsStateCopyWith<ViewProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewProductsStateCopyWith<$Res> {
  factory $ViewProductsStateCopyWith(
          ViewProductsState value, $Res Function(ViewProductsState) then) =
      _$ViewProductsStateCopyWithImpl<$Res, ViewProductsState>;
  @useResult
  $Res call(
      {String message,
      List<Product>? products,
      ViewProductsStatus viewProductStatus});
}

/// @nodoc
class _$ViewProductsStateCopyWithImpl<$Res, $Val extends ViewProductsState>
    implements $ViewProductsStateCopyWith<$Res> {
  _$ViewProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? products = freezed,
    Object? viewProductStatus = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      viewProductStatus: null == viewProductStatus
          ? _value.viewProductStatus
          : viewProductStatus // ignore: cast_nullable_to_non_nullable
              as ViewProductsStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewProductsStateCopyWith<$Res>
    implements $ViewProductsStateCopyWith<$Res> {
  factory _$$_ViewProductsStateCopyWith(_$_ViewProductsState value,
          $Res Function(_$_ViewProductsState) then) =
      __$$_ViewProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      List<Product>? products,
      ViewProductsStatus viewProductStatus});
}

/// @nodoc
class __$$_ViewProductsStateCopyWithImpl<$Res>
    extends _$ViewProductsStateCopyWithImpl<$Res, _$_ViewProductsState>
    implements _$$_ViewProductsStateCopyWith<$Res> {
  __$$_ViewProductsStateCopyWithImpl(
      _$_ViewProductsState _value, $Res Function(_$_ViewProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? products = freezed,
    Object? viewProductStatus = null,
  }) {
    return _then(_$_ViewProductsState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      viewProductStatus: null == viewProductStatus
          ? _value.viewProductStatus
          : viewProductStatus // ignore: cast_nullable_to_non_nullable
              as ViewProductsStatus,
    ));
  }
}

/// @nodoc

class _$_ViewProductsState extends _ViewProductsState {
  const _$_ViewProductsState(
      {this.message = empty,
      final List<Product>? products,
      required this.viewProductStatus})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final String message;
  final List<Product>? _products;
  @override
  List<Product>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ViewProductsStatus viewProductStatus;

  @override
  String toString() {
    return 'ViewProductsState(message: $message, products: $products, viewProductStatus: $viewProductStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewProductsState &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.viewProductStatus, viewProductStatus) ||
                other.viewProductStatus == viewProductStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_products), viewProductStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewProductsStateCopyWith<_$_ViewProductsState> get copyWith =>
      __$$_ViewProductsStateCopyWithImpl<_$_ViewProductsState>(
          this, _$identity);
}

abstract class _ViewProductsState extends ViewProductsState {
  const factory _ViewProductsState(
          {final String message,
          final List<Product>? products,
          required final ViewProductsStatus viewProductStatus}) =
      _$_ViewProductsState;
  const _ViewProductsState._() : super._();

  @override
  String get message;
  @override
  List<Product>? get products;
  @override
  ViewProductsStatus get viewProductStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ViewProductsStateCopyWith<_$_ViewProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
