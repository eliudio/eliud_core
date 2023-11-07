import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';

abstract class ExtendedAppBarComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ExtendedAppBarInitEvent extends ExtendedAppBarComponentEvent {
  final AppBarModel value;

  ExtendedAppBarInitEvent({required this.value});
}

class ExtendedAppBarComponentUpdated extends ExtendedAppBarComponentEvent {
  final AppBarModel value;

  ExtendedAppBarComponentUpdated({required this.value});
}
