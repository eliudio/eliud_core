/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_policy_model.dart';

abstract class AppPolicyListEvent extends Equatable {
  const AppPolicyListEvent();
  @override
  List<Object?> get props => [];
}

class LoadAppPolicyList extends AppPolicyListEvent {}

class NewPage extends AppPolicyListEvent {}

class AddAppPolicyList extends AppPolicyListEvent {
  final AppPolicyModel? value;

  const AddAppPolicyList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddAppPolicyList{ value: $value }';
}

class UpdateAppPolicyList extends AppPolicyListEvent {
  final AppPolicyModel? value;

  const UpdateAppPolicyList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateAppPolicyList{ value: $value }';
}

class DeleteAppPolicyList extends AppPolicyListEvent {
  final AppPolicyModel? value;

  const DeleteAppPolicyList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteAppPolicyList{ value: $value }';
}

class AppPolicyListUpdated extends AppPolicyListEvent {
  final List<AppPolicyModel?>? value;
  final bool? mightHaveMore;

  const AppPolicyListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'AppPolicyListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class AppPolicyChangeQuery extends AppPolicyListEvent {
  final EliudQuery newQuery;

  const AppPolicyChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'AppPolicyChangeQuery{ value: $newQuery }';
}

