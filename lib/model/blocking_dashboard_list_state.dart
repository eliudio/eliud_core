/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';

abstract class BlockingDashboardListState extends Equatable {
  const BlockingDashboardListState();

  @override
  List<Object?> get props => [];
}

class BlockingDashboardListLoading extends BlockingDashboardListState {}

class BlockingDashboardListLoaded extends BlockingDashboardListState {
  final List<BlockingDashboardModel?>? values;
  final bool? mightHaveMore;

  const BlockingDashboardListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'BlockingDashboardListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is BlockingDashboardListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class BlockingDashboardNotLoaded extends BlockingDashboardListState {}

