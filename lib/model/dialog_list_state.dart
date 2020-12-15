/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/dialog_model.dart';

abstract class DialogListState extends Equatable {
  const DialogListState();

  @override
  List<Object> get props => [];
}

class DialogListLoading extends DialogListState {}

class DialogListLoaded extends DialogListState {
  final List<DialogModel> values;

  const DialogListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'DialogListLoaded { values: $values }';
}

class DialogNotLoaded extends DialogListState {}

