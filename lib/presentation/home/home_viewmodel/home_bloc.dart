import 'package:bloc/bloc.dart';
import 'package:hnflutter_challenge/presentation/home/view_product_status.dart';
import 'home_event.dart';
import 'home_state.dart';

class ViewProductsBloc extends Bloc<ViewProductsEvent, ViewProductsState> {

  ViewProductsBloc(this._allBakeryUseCase)
      : super(ViewProductsState(viewProductStatus: Loading())) {
    on<FetchProducts>((event, emit) => _productViewed(event));
  }

  _productViewed(FetchProducts event) async {
    emit(state.copyWith(viewProductStatus: Loading()));
    try {
      final result = await _allBakeryUseCase.execute(null);
      result.fold(
          (l) => emit(ViewProductsState(viewProductStatus: Failed(l.message))),
          (r) => emit(
              ViewProductsState(products: r, viewProductStatus: Success())));
    } on Exception catch (e) {
      emit(state.copyWith(viewProductStatus: Failed(e.toString())));
    }
  }
}
