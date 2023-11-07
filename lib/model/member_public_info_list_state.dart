/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_public_info_model.dart';

abstract class MemberPublicInfoListState extends Equatable {
  const MemberPublicInfoListState();

  @override
  List<Object?> get props => [];
}

class MemberPublicInfoListLoading extends MemberPublicInfoListState {}

class MemberPublicInfoListLoaded extends MemberPublicInfoListState {
  final List<MemberPublicInfoModel?>? values;
  final bool? mightHaveMore;

  const MemberPublicInfoListLoaded(
      {this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'MemberPublicInfoListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is MemberPublicInfoListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class MemberPublicInfoNotLoaded extends MemberPublicInfoListState {}
