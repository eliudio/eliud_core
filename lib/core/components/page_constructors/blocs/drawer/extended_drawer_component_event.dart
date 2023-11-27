import 'package:eliud_core_main/model/drawer_model.dart';
import 'package:equatable/equatable.dart';

abstract class ExtendedDrawerComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ExtendedDrawerInitEvent extends ExtendedDrawerComponentEvent {
  final DrawerModel value;

  ExtendedDrawerInitEvent({required this.value});
}

class ExtendedDrawerComponentUpdated extends ExtendedDrawerComponentEvent {
  final DrawerModel value;

  ExtendedDrawerComponentUpdated({required this.value});
}
