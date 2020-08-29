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
import 'grid_view_model.dart';

abstract class GridViewState extends Equatable {
  const GridViewState();

  @override
  List<Object> get props => [];
}

class GridViewUninitialized extends GridViewState {}

class GridViewError extends GridViewState {
  final String message;
  GridViewError({ this.message });
}

class GridViewLoaded extends GridViewState {
  final GridViewModel value;

  const GridViewLoaded({ this.value });

  GridViewLoaded copyWith({ GridViewModel copyThis }) {
    return GridViewLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'GridViewModelLoaded { value: $value }';
}


