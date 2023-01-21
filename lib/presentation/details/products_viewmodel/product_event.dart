import 'package:equatable/equatable.dart';

abstract class ViewProductsEvent extends Equatable {
  const ViewProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ViewProductsEvent {
  final int? bakeryId;
  const FetchProducts(this.bakeryId);

  @override
  List<Object> get props => [];
}
