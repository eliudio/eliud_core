/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_model.dart';

abstract class MemberListState extends Equatable {
  const MemberListState();

  @override
  List<Object?> get props => [];
}

class MemberListLoading extends MemberListState {}

class MemberListLoaded extends MemberListState {
  final List<MemberModel?>? values;
  final bool? mightHaveMore;

  const MemberListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'MemberListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is MemberListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class MemberNotLoaded extends MemberListState {}

