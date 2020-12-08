/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/home_menu_model.dart';

abstract class HomeMenuListEvent extends Equatable {
  const HomeMenuListEvent();
  @override
  List<Object> get props => [];
}

class LoadHomeMenuList extends HomeMenuListEvent {
  final String orderBy;
  final bool descending;

  LoadHomeMenuList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadHomeMenuListWithDetails extends HomeMenuListEvent {}

class AddHomeMenuList extends HomeMenuListEvent {
  final HomeMenuModel value;

  const AddHomeMenuList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddHomeMenuList{ value: $value }';
}

class UpdateHomeMenuList extends HomeMenuListEvent {
  final HomeMenuModel value;

  const UpdateHomeMenuList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateHomeMenuList{ value: $value }';
}

class DeleteHomeMenuList extends HomeMenuListEvent {
  final HomeMenuModel value;

  const DeleteHomeMenuList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteHomeMenuList{ value: $value }';
}

class HomeMenuListUpdated extends HomeMenuListEvent {
  final List<HomeMenuModel> value;

  const HomeMenuListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'HomeMenuListUpdated{ value: $value }';
}

