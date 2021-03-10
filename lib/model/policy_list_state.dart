/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/policy_model.dart';

abstract class PolicyListState extends Equatable {
  const PolicyListState();

  @override
  List<Object> get props => [];
}

class PolicyListLoading extends PolicyListState {}

class PolicyListLoaded extends PolicyListState {
  final List<PolicyModel> values;
  final bool mightHaveMore;

  const PolicyListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'PolicyListLoaded { values: $values }';
}

class PolicyNotLoaded extends PolicyListState {}

