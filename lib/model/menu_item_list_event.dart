/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'menu_item_model.dart';

abstract class MenuItemListEvent extends Equatable {
  const MenuItemListEvent();
  @override
  List<Object> get props => [];
}

class LoadMenuItemList extends MenuItemListEvent {}
class LoadMenuItemListWithDetails extends MenuItemListEvent {}

class AddMenuItemList extends MenuItemListEvent {
  final MenuItemModel value;

  const AddMenuItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddMenuItemList{ value: $value }';
}

class UpdateMenuItemList extends MenuItemListEvent {
  final MenuItemModel value;

  const UpdateMenuItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateMenuItemList{ value: $value }';
}

class DeleteMenuItemList extends MenuItemListEvent {
  final MenuItemModel value;

  const DeleteMenuItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteMenuItemList{ value: $value }';
}

class MenuItemListUpdated extends MenuItemListEvent {
  final List<MenuItemModel> value;

  const MenuItemListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'MenuItemListUpdated{ value: $value }';
}

