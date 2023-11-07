/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';

abstract class MemberDashboardListState extends Equatable {
  const MemberDashboardListState();

  @override
  List<Object?> get props => [];
}

class MemberDashboardListLoading extends MemberDashboardListState {}

class MemberDashboardListLoaded extends MemberDashboardListState {
  final List<MemberDashboardModel?>? values;
  final bool? mightHaveMore;

  const MemberDashboardListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'MemberDashboardListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is MemberDashboardListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class MemberDashboardNotLoaded extends MemberDashboardListState {}
