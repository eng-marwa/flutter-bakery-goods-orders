import 'package:hnflutter_challenge/data/model/auth.dart';
import 'package:hnflutter_challenge/presentation/auth/form_submission_status.dart';
import 'package:hnflutter_challenge/presentation/auth/login/login_viewmodel/login_event.dart';
import 'package:hnflutter_challenge/presentation/auth/login/login_viewmodel/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/login_use_case.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginState(formStatus: InitialFormStatus())) {
    on<LoginEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));
    on<LoginPasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<LoginSubmitted>((event, emit) => _loginSubmitted(event));
  }

  _loginSubmitted(LoginSubmitted event) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      final result = await _loginUseCase.execute(AuthRequest('marwa@gmail.com', '123456'));
      emit(state.copyWith(formStatus: SubmissionSuccess()));
      result.fold(
          (l) => emit(LoginState(formStatus: SubmissionFailed(l.message))),
          (r) => emit(LoginState(user: r, formStatus: SubmissionSuccess())));
    } on Exception catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
    }
  }
}
