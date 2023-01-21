import 'package:bloc/bloc.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/profile_event.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/profile_state.dart';
import '../../../domain/usecases/user_use_case.dart/view_selected_profile_bakery_use_case.dart';
import '../../home/profile_viewmodel/view_profile_status.dart';

class ViewProfileBloc extends Bloc<ViewBakeryEvent, ViewProfileState> {
  BakeryProfileUseCase _bakeryProfileUseCase;

  ViewProfileBloc(this._bakeryProfileUseCase)
      : super(ViewProfileState(viewProfileStatus: Loading())) {
    on<ViewProfile>((event, emit) => _viewProfile(event));
  }

  _viewProfile(ViewProfile event) async {
    emit(state.copyWith(viewProfileStatus: Loading()));
    final results = await _bakeryProfileUseCase.execute(event.bakeryId);
    results.fold(
        (l) => emit(ViewProfileState(viewProfileStatus: Failed(l.message))),
        (r) => emit(ViewProfileState(viewProfileStatus: Success(), bakery: r)));
  }
}
