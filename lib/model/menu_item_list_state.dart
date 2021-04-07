/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/menu_item_model.dart';

abstract class MenuItemListState extends Equatable {
  const MenuItemListState();

  @override
  List<Object?> get props => [];
}

class MenuItemListLoading extends MenuItemListState {}

class MenuItemListLoaded extends MenuItemListState {
  final List<MenuItemModel>? values;
  final bool? mightHaveMore;

  const MenuItemListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'MenuItemListLoaded { values: $values }';
}

class MenuItemNotLoaded extends MenuItemListState {}

