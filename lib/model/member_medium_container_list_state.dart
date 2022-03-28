/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_medium_container_model.dart';

abstract class MemberMediumContainerListState extends Equatable {
  const MemberMediumContainerListState();

  @override
  List<Object?> get props => [];
}

class MemberMediumContainerListLoading extends MemberMediumContainerListState {}

class MemberMediumContainerListLoaded extends MemberMediumContainerListState {
  final List<MemberMediumContainerModel?>? values;
  final bool? mightHaveMore;

  const MemberMediumContainerListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'MemberMediumContainerListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is MemberMediumContainerListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class MemberMediumContainerNotLoaded extends MemberMediumContainerListState {}

