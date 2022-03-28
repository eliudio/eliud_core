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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/menu_item_model.dart';

abstract class MenuItemListState extends Equatable {
  const MenuItemListState();

  @override
  List<Object?> get props => [];
}

class MenuItemListLoading extends MenuItemListState {}

class MenuItemListLoaded extends MenuItemListState {
  final List<MenuItemModel?>? values;
  final bool? mightHaveMore;

  const MenuItemListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'MenuItemListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is MenuItemListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class MenuItemNotLoaded extends MenuItemListState {}

