/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/drawer_model.dart';

abstract class DrawerListState extends Equatable {
  const DrawerListState();

  @override
  List<Object> get props => [];
}

class DrawerListLoading extends DrawerListState {}

class DrawerListLoaded extends DrawerListState {
  final List<DrawerModel> values;

  const DrawerListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'DrawerListLoaded { values: $values }';
}

class DrawerNotLoaded extends DrawerListState {}

