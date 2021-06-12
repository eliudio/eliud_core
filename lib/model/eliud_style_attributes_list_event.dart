/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';

abstract class EliudStyleAttributesListEvent extends Equatable {
  const EliudStyleAttributesListEvent();
  @override
  List<Object?> get props => [];
}

class LoadEliudStyleAttributesList extends EliudStyleAttributesListEvent {}

class NewPage extends EliudStyleAttributesListEvent {}

class AddEliudStyleAttributesList extends EliudStyleAttributesListEvent {
  final EliudStyleAttributesModel? value;

  const AddEliudStyleAttributesList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddEliudStyleAttributesList{ value: $value }';
}

class UpdateEliudStyleAttributesList extends EliudStyleAttributesListEvent {
  final EliudStyleAttributesModel? value;

  const UpdateEliudStyleAttributesList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateEliudStyleAttributesList{ value: $value }';
}

class DeleteEliudStyleAttributesList extends EliudStyleAttributesListEvent {
  final EliudStyleAttributesModel? value;

  const DeleteEliudStyleAttributesList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteEliudStyleAttributesList{ value: $value }';
}

class EliudStyleAttributesListUpdated extends EliudStyleAttributesListEvent {
  final List<EliudStyleAttributesModel?>? value;
  final bool? mightHaveMore;

  const EliudStyleAttributesListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'EliudStyleAttributesListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

