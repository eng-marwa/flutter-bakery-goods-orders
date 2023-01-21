import 'package:equatable/equatable.dart';

abstract class BakeriesEvent extends Equatable {
  const BakeriesEvent();

  @override
  List<Object> get props => [];
}

class FetchBakeries extends BakeriesEvent {
  const FetchBakeries();

  @override
  List<Object> get props => [];
}

class FilterByType extends BakeriesEvent {
  final String type;
  const FilterByType(this.type);

  @override
  List<Object> get props => [];
}
class FilterByProximity extends BakeriesEvent {
  const FilterByProximity();

  @override
  List<Object> get props => [];
}
