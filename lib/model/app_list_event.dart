/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AppListEvent extends Equatable {
  const AppListEvent();
  @override
  List<Object?> get props => [];
}

class LoadAppList extends AppListEvent {}

class NewPage extends AppListEvent {}

class AddAppList extends AppListEvent {
  final AppModel? value;

  const AddAppList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddAppList{ value: $value }';
}

class UpdateAppList extends AppListEvent {
  final AppModel? value;

  const UpdateAppList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateAppList{ value: $value }';
}

class DeleteAppList extends AppListEvent {
  final AppModel? value;

  const DeleteAppList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteAppList{ value: $value }';
}

class AppListUpdated extends AppListEvent {
  final List<AppModel?>? value;
  final bool? mightHaveMore;

  const AppListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'AppListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class AppChangeQuery extends AppListEvent {
  final EliudQuery newQuery;

  const AppChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'AppChangeQuery{ value: $newQuery }';
}

