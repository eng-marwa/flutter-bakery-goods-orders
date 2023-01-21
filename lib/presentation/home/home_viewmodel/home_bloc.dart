import 'package:bloc/bloc.dart';
import '../../../domain/usecases/user_use_case.dart/filter_by_proximity_use_case.dart';
import '../../../domain/usecases/user_use_case.dart/filter_by_type_use_case.dart';
import '../../../domain/usecases/user_use_case.dart/view_barkeries_list_use_case.dart';
import 'view_bakeries_status.dart';
import 'home_event.dart';
import 'home_state.dart';

class ViewBakeriesBloc extends Bloc<BakeriesEvent, ViewBakeriesState> {
  ViewBakeriesListUseCase _viewBakeriesListUseCase;
  FilterByTypeUseCase _byTypeUseCase;
  FilterByProximityUseCase _byProximityUseCase;

  ViewBakeriesBloc(this._viewBakeriesListUseCase, this._byTypeUseCase,
      this._byProximityUseCase)
      : super(ViewBakeriesState(viewBakeriesStatus: Loading())) {
    on<FetchBakeries>((event, emit) => _fetchBakeries());
    on<FilterByType>((event, emit) => _filterByType(event));
    on<FilterByProximity>((event, emit) => _filterByProximity());
  }

  _fetchBakeries() async {
    emit(state.copyWith(viewBakeriesStatus: Loading()));
    final results = await _viewBakeriesListUseCase.execute(null);
    results.fold(
        (l) => emit(ViewBakeriesState(viewBakeriesStatus: Failed(l.message))),
        (r) => emit(
            ViewBakeriesState(viewBakeriesStatus: Success(), bakeries: r)));
  }

  _filterByType(FilterByType event) async {
    emit(state.copyWith(viewBakeriesStatus: Loading()));
    final results = await _byTypeUseCase.execute(event.type.toLowerCase());
    results.fold(
        (l) => emit(ViewBakeriesState(viewBakeriesStatus: Failed(l.message))),
        (r) => emit(
            ViewBakeriesState(viewBakeriesStatus: Success(), bakeries: r)));
  }

  _filterByProximity() async {
    emit(state.copyWith(viewBakeriesStatus: Loading()));
    final results = await _byProximityUseCase.execute(null);
    results.fold(
        (l) => emit(ViewBakeriesState(viewBakeriesStatus: Failed(l.message))),
        (r) => emit(
            ViewBakeriesState(viewBakeriesStatus: Success(), bakeries: r)));
  }
}
