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

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/menu_def_model.dart';

abstract class MenuDefListEvent extends Equatable {
  const MenuDefListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMenuDefList extends MenuDefListEvent {}

class NewPage extends MenuDefListEvent {}

class AddMenuDefList extends MenuDefListEvent {
  final MenuDefModel? value;

  const AddMenuDefList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddMenuDefList{ value: $value }';
}

class UpdateMenuDefList extends MenuDefListEvent {
  final MenuDefModel? value;

  const UpdateMenuDefList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateMenuDefList{ value: $value }';
}

class DeleteMenuDefList extends MenuDefListEvent {
  final MenuDefModel? value;

  const DeleteMenuDefList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteMenuDefList{ value: $value }';
}

class MenuDefListUpdated extends MenuDefListEvent {
  final List<MenuDefModel?>? value;
  final bool? mightHaveMore;

  const MenuDefListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'MenuDefListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class MenuDefChangeQuery extends MenuDefListEvent {
  final EliudQuery newQuery;

  const MenuDefChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'MenuDefChangeQuery{ value: $newQuery }';
}

