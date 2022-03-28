/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/public_medium_model.dart';

abstract class PublicMediumListEvent extends Equatable {
  const PublicMediumListEvent();
  @override
  List<Object?> get props => [];
}

class LoadPublicMediumList extends PublicMediumListEvent {}

class NewPage extends PublicMediumListEvent {}

class AddPublicMediumList extends PublicMediumListEvent {
  final PublicMediumModel? value;

  const AddPublicMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddPublicMediumList{ value: $value }';
}

class UpdatePublicMediumList extends PublicMediumListEvent {
  final PublicMediumModel? value;

  const UpdatePublicMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdatePublicMediumList{ value: $value }';
}

class DeletePublicMediumList extends PublicMediumListEvent {
  final PublicMediumModel? value;

  const DeletePublicMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeletePublicMediumList{ value: $value }';
}

class PublicMediumListUpdated extends PublicMediumListEvent {
  final List<PublicMediumModel?>? value;
  final bool? mightHaveMore;

  const PublicMediumListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'PublicMediumListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class PublicMediumChangeQuery extends PublicMediumListEvent {
  final EliudQuery newQuery;

  const PublicMediumChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'PublicMediumChangeQuery{ value: $newQuery }';
}

