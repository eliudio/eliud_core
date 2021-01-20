/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/menu_def_model.dart';

abstract class MenuDefListState extends Equatable {
  const MenuDefListState();

  @override
  List<Object> get props => [];
}

class MenuDefListLoading extends MenuDefListState {}

class MenuDefListLoaded extends MenuDefListState {
  final List<MenuDefModel> values;
  final bool mightHaveMore;

  const MenuDefListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'MenuDefListLoaded { values: $values }';
}

class MenuDefNotLoaded extends MenuDefListState {}

