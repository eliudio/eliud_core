/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_policy_item_model.dart';

abstract class AppPolicyItemListState extends Equatable {
  const AppPolicyItemListState();

  @override
  List<Object?> get props => [];
}

class AppPolicyItemListLoading extends AppPolicyItemListState {}

class AppPolicyItemListLoaded extends AppPolicyItemListState {
  final List<AppPolicyItemModel>? values;
  final bool? mightHaveMore;

  const AppPolicyItemListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'AppPolicyItemListLoaded { values: $values }';
}

class AppPolicyItemNotLoaded extends AppPolicyItemListState {}

