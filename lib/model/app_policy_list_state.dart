/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/app_policy_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppPolicyListState extends Equatable {
  const AppPolicyListState();

  @override
  List<Object?> get props => [];
}

class AppPolicyListLoading extends AppPolicyListState {}

class AppPolicyListLoaded extends AppPolicyListState {
  final List<AppPolicyModel?>? values;
  final bool? mightHaveMore;

  const AppPolicyListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'AppPolicyListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is AppPolicyListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class AppPolicyNotLoaded extends AppPolicyListState {}

