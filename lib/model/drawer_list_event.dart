/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/drawer_model.dart';

abstract class DrawerListEvent extends Equatable {
  const DrawerListEvent();
  @override
  List<Object> get props => [];
}

class LoadDrawerList extends DrawerListEvent {}
class LoadDrawerListWithDetails extends DrawerListEvent {}

class AddDrawerList extends DrawerListEvent {
  final DrawerModel value;

  const AddDrawerList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddDrawerList{ value: $value }';
}

class UpdateDrawerList extends DrawerListEvent {
  final DrawerModel value;

  const UpdateDrawerList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateDrawerList{ value: $value }';
}

class DeleteDrawerList extends DrawerListEvent {
  final DrawerModel value;

  const DeleteDrawerList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteDrawerList{ value: $value }';
}

class DrawerListUpdated extends DrawerListEvent {
  final List<DrawerModel> value;

  const DrawerListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DrawerListUpdated{ value: $value }';
}

