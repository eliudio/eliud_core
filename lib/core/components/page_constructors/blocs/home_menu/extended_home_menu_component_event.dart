import 'package:eliud_core_model/model/home_menu_model.dart';
import 'package:equatable/equatable.dart';

abstract class ExtendedHomeMenuComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ExtendedHomeMenuInitEvent extends ExtendedHomeMenuComponentEvent {
  final HomeMenuModel value;

  ExtendedHomeMenuInitEvent({required this.value});
}

class ExtendedHomeMenuComponentUpdated extends ExtendedHomeMenuComponentEvent {
  final HomeMenuModel value;

  ExtendedHomeMenuComponentUpdated({required this.value});
}
