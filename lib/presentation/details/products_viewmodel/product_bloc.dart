import 'package:bloc/bloc.dart';
import 'package:hnflutter_challenge/presentation/details/products_viewmodel/view_product_status.dart';
import '../../../domain/usecases/user_use_case.dart/products_in_bakery_use_cases.dart';
import 'product_event.dart';
import 'product_state.dart';

class ViewProductsBloc extends Bloc<ViewProductsEvent, ViewProductsState> {
  ViewProductsUseCase _productsUseCase;
  ViewProductsBloc(this._productsUseCase) : super(ViewProductsState(viewProductStatus: Loading())){
    on<FetchProducts>((event, emit) => _productViewed(event));
  }

  _productViewed(FetchProducts event) async {
    emit(state.copyWith(viewProductStatus: Loading()));
    try {
      final result = await _productsUseCase.execute(event.bakeryId);
      result.fold(
          (l) => emit(ViewProductsState(viewProductStatus: Failed(l.message))),
          (r) => emit(
              ViewProductsState(products: r, viewProductStatus: Success())));
    } on Exception catch (e) {
      emit(state.copyWith(viewProductStatus: Failed(e.toString())));
    }
  }
}
