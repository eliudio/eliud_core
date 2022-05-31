/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/backend_request_model.dart';

abstract class BackendRequestListState extends Equatable {
  const BackendRequestListState();

  @override
  List<Object?> get props => [];
}

class BackendRequestListLoading extends BackendRequestListState {}

class BackendRequestListLoaded extends BackendRequestListState {
  final List<BackendRequestModel?>? values;
  final bool? mightHaveMore;

  const BackendRequestListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'BackendRequestListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is BackendRequestListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class BackendRequestNotLoaded extends BackendRequestListState {}

