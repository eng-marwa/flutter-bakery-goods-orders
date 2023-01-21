import 'package:equatable/equatable.dart';

abstract class ViewBakeryEvent extends Equatable {
  const ViewBakeryEvent();

  @override
  List<Object> get props => [];
}

class ViewProfile extends ViewBakeryEvent {
  final int? bakeryId;
  const ViewProfile(this.bakeryId);

  @override
  List<Object> get props => [];
}

