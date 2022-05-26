/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';

abstract class DialogListEvent extends Equatable {
  const DialogListEvent();
  @override
  List<Object?> get props => [];
}

class LoadDialogList extends DialogListEvent {}

class NewPage extends DialogListEvent {}

class AddDialogList extends DialogListEvent {
  final DialogModel? value;

  const AddDialogList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddDialogList{ value: $value }';
}

class UpdateDialogList extends DialogListEvent {
  final DialogModel? value;

  const UpdateDialogList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateDialogList{ value: $value }';
}

class DeleteDialogList extends DialogListEvent {
  final DialogModel? value;

  const DeleteDialogList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteDialogList{ value: $value }';
}

class DialogListUpdated extends DialogListEvent {
  final List<DialogModel?>? value;
  final bool? mightHaveMore;

  const DialogListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'DialogListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class DialogChangeQuery extends DialogListEvent {
  final EliudQuery? newQuery;

  const DialogChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'DialogChangeQuery{ value: $newQuery }';
}

