// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {String email,
      String password,
      User? user,
      String message,
      FormSubmissionStatus formStatus});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? user = freezed,
    Object? message = null,
    Object? formStatus = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterStatusCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStatusCopyWith(
          _$_RegisterStatus value, $Res Function(_$_RegisterStatus) then) =
      __$$_RegisterStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      User? user,
      String message,
      FormSubmissionStatus formStatus});
}

/// @nodoc
class __$$_RegisterStatusCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterStatus>
    implements _$$_RegisterStatusCopyWith<$Res> {
  __$$_RegisterStatusCopyWithImpl(
      _$_RegisterStatus _value, $Res Function(_$_RegisterStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? user = freezed,
    Object? message = null,
    Object? formStatus = null,
  }) {
    return _then(_$_RegisterStatus(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$_RegisterStatus extends _RegisterStatus {
  const _$_RegisterStatus(
      {this.email = empty,
      this.password = empty,
      this.user,
      this.message = empty,
      required this.formStatus})
      : super._();

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  final User? user;
  @override
  @JsonKey()
  final String message;
  @override
  final FormSubmissionStatus formStatus;

  @override
  String toString() {
    return 'RegisterState(email: $email, password: $password, user: $user, message: $message, formStatus: $formStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterStatus &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, user, message, formStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterStatusCopyWith<_$_RegisterStatus> get copyWith =>
      __$$_RegisterStatusCopyWithImpl<_$_RegisterStatus>(this, _$identity);
}

abstract class _RegisterStatus extends RegisterState {
  const factory _RegisterStatus(
      {final String email,
      final String password,
      final User? user,
      final String message,
      required final FormSubmissionStatus formStatus}) = _$_RegisterStatus;
  const _RegisterStatus._() : super._();

  @override
  String get email;
  @override
  String get password;
  @override
  User? get user;
  @override
  String get message;
  @override
  FormSubmissionStatus get formStatus;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStatusCopyWith<_$_RegisterStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
