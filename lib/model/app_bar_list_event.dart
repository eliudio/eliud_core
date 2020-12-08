/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';

abstract class AppBarListEvent extends Equatable {
  const AppBarListEvent();
  @override
  List<Object> get props => [];
}

class LoadAppBarList extends AppBarListEvent {
  final String orderBy;
  final bool descending;

  LoadAppBarList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadAppBarListWithDetails extends AppBarListEvent {}

class AddAppBarList extends AppBarListEvent {
  final AppBarModel value;

  const AddAppBarList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddAppBarList{ value: $value }';
}

class UpdateAppBarList extends AppBarListEvent {
  final AppBarModel value;

  const UpdateAppBarList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateAppBarList{ value: $value }';
}

class DeleteAppBarList extends AppBarListEvent {
  final AppBarModel value;

  const DeleteAppBarList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteAppBarList{ value: $value }';
}

class AppBarListUpdated extends AppBarListEvent {
  final List<AppBarModel> value;

  const AppBarListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AppBarListUpdated{ value: $value }';
}

