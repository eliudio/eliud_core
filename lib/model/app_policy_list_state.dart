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

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_policy_model.dart';

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
}

class AppPolicyNotLoaded extends AppPolicyListState {}

