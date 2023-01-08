import 'package:email_validator/email_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnflutter_challenge/domain/entity/user.dart';
import 'package:hnflutter_challenge/presentation/auth/form_submission_status.dart';
import 'package:hnflutter_challenge/utils/constants/constants.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();
  bool get isValidEmail => EmailValidator.validate(email);
  bool get isValidPassword => password.length >=6 && password.length<=12;

  const factory RegisterState(
          {@Default(empty) String email,
          @Default(empty) String password, User? user,
          @Default(empty) String message,
          required FormSubmissionStatus formStatus}) =
      _RegisterStatus;
}
