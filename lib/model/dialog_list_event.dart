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

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/dialog_model.dart';

abstract class DialogListEvent extends Equatable {
  const DialogListEvent();
  @override
  List<Object> get props => [];
}

class LoadDialogList extends DialogListEvent {
  final String orderBy;
  final bool descending;

  LoadDialogList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadDialogListWithDetails extends DialogListEvent {}

class AddDialogList extends DialogListEvent {
  final DialogModel value;

  const AddDialogList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddDialogList{ value: $value }';
}

class UpdateDialogList extends DialogListEvent {
  final DialogModel value;

  const UpdateDialogList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateDialogList{ value: $value }';
}

class DeleteDialogList extends DialogListEvent {
  final DialogModel value;

  const DeleteDialogList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteDialogList{ value: $value }';
}

class DialogListUpdated extends DialogListEvent {
  final List<DialogModel> value;

  const DialogListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DialogListUpdated{ value: $value }';
}

