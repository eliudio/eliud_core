/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/background_model.dart';

abstract class BackgroundListEvent extends Equatable {
  const BackgroundListEvent();
  @override
  List<Object?> get props => [];
}

class LoadBackgroundList extends BackgroundListEvent {}

class NewPage extends BackgroundListEvent {}

class AddBackgroundList extends BackgroundListEvent {
  final BackgroundModel? value;

  const AddBackgroundList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddBackgroundList{ value: $value }';
}

class UpdateBackgroundList extends BackgroundListEvent {
  final BackgroundModel? value;

  const UpdateBackgroundList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateBackgroundList{ value: $value }';
}

class DeleteBackgroundList extends BackgroundListEvent {
  final BackgroundModel? value;

  const DeleteBackgroundList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteBackgroundList{ value: $value }';
}

class BackgroundListUpdated extends BackgroundListEvent {
  final List<BackgroundModel?>? value;
  final bool? mightHaveMore;

  const BackgroundListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'BackgroundListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

