/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_model.dart';

abstract class BlockingListState extends Equatable {
  const BlockingListState();

  @override
  List<Object?> get props => [];
}

class BlockingListLoading extends BlockingListState {}

class BlockingListLoaded extends BlockingListState {
  final List<BlockingModel?>? values;
  final bool? mightHaveMore;

  const BlockingListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'BlockingListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is BlockingListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class BlockingNotLoaded extends BlockingListState {}

