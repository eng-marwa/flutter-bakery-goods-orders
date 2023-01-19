import 'package:equatable/equatable.dart';

abstract class ViewProductsEvent extends Equatable {
  const ViewProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ViewProductsEvent {
  const FetchProducts();

  @override
  List<Object> get props => [];
}
