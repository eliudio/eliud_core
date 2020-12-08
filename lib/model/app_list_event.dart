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

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AppListEvent extends Equatable {
  const AppListEvent();
  @override
  List<Object> get props => [];
}

class LoadAppList extends AppListEvent {
  final String orderBy;
  final bool descending;

  LoadAppList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadAppListWithDetails extends AppListEvent {}

class AddAppList extends AppListEvent {
  final AppModel value;

  const AddAppList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddAppList{ value: $value }';
}

class UpdateAppList extends AppListEvent {
  final AppModel value;

  const UpdateAppList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateAppList{ value: $value }';
}

class DeleteAppList extends AppListEvent {
  final AppModel value;

  const DeleteAppList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteAppList{ value: $value }';
}

class AppListUpdated extends AppListEvent {
  final List<AppModel> value;

  const AppListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AppListUpdated{ value: $value }';
}

