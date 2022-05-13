/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/body_component_model.dart';

abstract class BodyComponentListEvent extends Equatable {
  const BodyComponentListEvent();
  @override
  List<Object?> get props => [];
}

class LoadBodyComponentList extends BodyComponentListEvent {}

class NewPage extends BodyComponentListEvent {}

class AddBodyComponentList extends BodyComponentListEvent {
  final BodyComponentModel? value;

  const AddBodyComponentList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddBodyComponentList{ value: $value }';
}

class UpdateBodyComponentList extends BodyComponentListEvent {
  final BodyComponentModel? value;

  const UpdateBodyComponentList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateBodyComponentList{ value: $value }';
}

class DeleteBodyComponentList extends BodyComponentListEvent {
  final BodyComponentModel? value;

  const DeleteBodyComponentList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteBodyComponentList{ value: $value }';
}

class BodyComponentListUpdated extends BodyComponentListEvent {
  final List<BodyComponentModel?>? value;
  final bool? mightHaveMore;

  const BodyComponentListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'BodyComponentListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class BodyComponentChangeQuery extends BodyComponentListEvent {
  final EliudQuery? newQuery;

  const BodyComponentChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'BodyComponentChangeQuery{ value: $newQuery }';
}

