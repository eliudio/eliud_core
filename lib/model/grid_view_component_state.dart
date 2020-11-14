/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/grid_view_model.dart';

abstract class GridViewComponentState extends Equatable {
  const GridViewComponentState();

  @override
  List<Object> get props => [];
}

class GridViewComponentUninitialized extends GridViewComponentState {}

class GridViewComponentError extends GridViewComponentState {
  final String message;
  GridViewComponentError({ this.message });
}

class GridViewComponentLoaded extends GridViewComponentState {
  final GridViewModel value;

  const GridViewComponentLoaded({ this.value });

  GridViewComponentLoaded copyWith({ GridViewModel copyThis }) {
    return GridViewComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'GridViewComponentLoaded { value: $value }';
}


