/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/menu_def_model.dart';

abstract class MenuDefListEvent extends Equatable {
  const MenuDefListEvent();
  @override
  List<Object> get props => [];
}

class LoadMenuDefList extends MenuDefListEvent {
  final String orderBy;
  final bool descending;

  LoadMenuDefList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadMenuDefListWithDetails extends MenuDefListEvent {}

class AddMenuDefList extends MenuDefListEvent {
  final MenuDefModel value;

  const AddMenuDefList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddMenuDefList{ value: $value }';
}

class UpdateMenuDefList extends MenuDefListEvent {
  final MenuDefModel value;

  const UpdateMenuDefList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateMenuDefList{ value: $value }';
}

class DeleteMenuDefList extends MenuDefListEvent {
  final MenuDefModel value;

  const DeleteMenuDefList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteMenuDefList{ value: $value }';
}

class MenuDefListUpdated extends MenuDefListEvent {
  final List<MenuDefModel> value;

  const MenuDefListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'MenuDefListUpdated{ value: $value }';
}

