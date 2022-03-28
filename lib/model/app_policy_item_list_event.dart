/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_policy_item_model.dart';

abstract class AppPolicyItemListEvent extends Equatable {
  const AppPolicyItemListEvent();
  @override
  List<Object?> get props => [];
}

class LoadAppPolicyItemList extends AppPolicyItemListEvent {}

class NewPage extends AppPolicyItemListEvent {}

class AddAppPolicyItemList extends AppPolicyItemListEvent {
  final AppPolicyItemModel? value;

  const AddAppPolicyItemList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddAppPolicyItemList{ value: $value }';
}

class UpdateAppPolicyItemList extends AppPolicyItemListEvent {
  final AppPolicyItemModel? value;

  const UpdateAppPolicyItemList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateAppPolicyItemList{ value: $value }';
}

class DeleteAppPolicyItemList extends AppPolicyItemListEvent {
  final AppPolicyItemModel? value;

  const DeleteAppPolicyItemList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteAppPolicyItemList{ value: $value }';
}

class AppPolicyItemListUpdated extends AppPolicyItemListEvent {
  final List<AppPolicyItemModel?>? value;
  final bool? mightHaveMore;

  const AppPolicyItemListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'AppPolicyItemListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class AppPolicyItemChangeQuery extends AppPolicyItemListEvent {
  final EliudQuery newQuery;

  const AppPolicyItemChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'AppPolicyItemChangeQuery{ value: $newQuery }';
}

