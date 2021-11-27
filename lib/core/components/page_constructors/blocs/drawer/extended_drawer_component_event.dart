import 'package:eliud_core/model/drawer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';

abstract class ExtendedDrawerComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ExtendedDrawerInitEvent extends ExtendedDrawerComponentEvent {
  final DrawerModel value;

  ExtendedDrawerInitEvent({ required this.value });
}

class ExtendedDrawerComponentUpdated extends ExtendedDrawerComponentEvent {
  final DrawerModel value;

  ExtendedDrawerComponentUpdated({ required this.value });
}


