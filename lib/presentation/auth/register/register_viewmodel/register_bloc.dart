import 'package:hnflutter_challenge/data/model/auth.dart';
import 'package:hnflutter_challenge/presentation/auth/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnflutter_challenge/presentation/auth/register/register_viewmodel/register_event.dart';
import 'package:hnflutter_challenge/presentation/auth/register/register_viewmodel/register_state.dart';

import '../../../../domain/usecases/Register_use_case.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterUseCase _RegisterUseCase;

  RegisterBloc(this._RegisterUseCase) : super(RegisterState(formStatus: InitialFormStatus())) {
    on<RegisterEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));
    on<RegisterPasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<RegisterSubmitted>((event, emit) => _RegisterSubmitted(event));
  }

  _RegisterSubmitted(RegisterSubmitted event) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      final result = await _RegisterUseCase.execute(AuthRequest('marwa@gmail.com', '123456'));
      emit(state.copyWith(formStatus: SubmissionSuccess()));
      result.fold(
          (l) => emit(RegisterState(formStatus: SubmissionFailed(l.message))),
          (r) => emit(RegisterState(user: r, formStatus: SubmissionSuccess())));
    } on Exception catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
    }
  }
}
