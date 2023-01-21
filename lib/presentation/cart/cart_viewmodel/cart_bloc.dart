import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/CartStatus.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_state.dart';

import '../../../domain/entity/item.dart';
import '../../../domain/usecases/cart_use_cases/add_item_use_case.dart';
import '../../../domain/usecases/cart_use_cases/empty_cart_use_case.dart';
import '../../../domain/usecases/cart_use_cases/remove_item_use_case.dart';
import '../../../domain/usecases/cart_use_cases/view_items_use_cases.dart';
import 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  AddItemUseCase _addItemUseCase;
  RemoveItemUseCase _removeItemUseCase;
  ViewAllItemsUseCase _viewAllItemsUseCase;
  RemoveAllItemsUseCase _removeAllItemsUseCase;

  CartBloc(this._addItemUseCase, this._removeItemUseCase,
      this._viewAllItemsUseCase, this._removeAllItemsUseCase)
      : super(CartState(status: LoadingStatus())) {
    on<AddItemToCartEvent>((event, emit) => _addNewItem(event));
    on<DeleteItemFromCartEvent>((event, emit) => _deleteExistingItem(event));
    on<ViewItemsFromCartEvent>((event, emit) => _viewAllItems());
    on<DeleteAllItemsEvent>((event, emit) => _deleteAllItems());
  }

  _addNewItem(AddItemToCartEvent event) async {
    emit(state.copyWith(status: LoadingStatus()));
    try {
      final result = await _addItemUseCase.execute(event.item);
      result.fold((l) => emit(CartState(status: FailedStatus(l.message))),
          (r) => emit(CartState(status: ItemAdded())));
    } on Exception catch (e) {
      emit(state.copyWith(status: FailedStatus(e.toString())));
    }
  }

  _deleteExistingItem(DeleteItemFromCartEvent event) async {
    emit(state.copyWith(status: LoadingStatus()));
    try {
      final result = await _removeItemUseCase.execute(event.itemId);
      result.fold((l) => emit(CartState(status: FailedStatus(l.message))),
          (r) => emit(CartState(status: ItemDeleted())));
    } on Exception catch (e) {
      emit(state.copyWith(status: FailedStatus(e.toString())));
    }
  }

  _viewAllItems() async {
    emit(state.copyWith(status: LoadingStatus()));
    try {
      final result = await _viewAllItemsUseCase.execute(null);
      result.fold(
          (l) => emit(CartState(status: FailedStatus(l.message))),
          (r) => {
                if (r.value.isEmpty)
                  {emit(CartState(status: NoItems()))}
                else
                  {emit(CartState(items: r, status: SuccessStatus()))}
              });
    } on Exception catch (e) {
      emit(state.copyWith(status: FailedStatus(e.toString())));
    }
  }

  _deleteAllItems() async {
    emit(state.copyWith(status: LoadingStatus()));
    try {
      final result = await _removeAllItemsUseCase.execute(null);
      result.fold((l) => emit(CartState(status: FailedStatus(l.message))),
          (r) => emit(CartState(status: NoItems())));
    } on Exception catch (e) {
      emit(state.copyWith(status: FailedStatus(e.toString())));
    }
  }
}
