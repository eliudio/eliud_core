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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:equatable/equatable.dart';

abstract class DialogListState extends Equatable {
  const DialogListState();

  @override
  List<Object?> get props => [];
}

class DialogListLoading extends DialogListState {}

class DialogListLoaded extends DialogListState {
  final List<DialogModel?>? values;
  final bool? mightHaveMore;

  const DialogListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'DialogListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is DialogListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class DialogNotLoaded extends DialogListState {}

