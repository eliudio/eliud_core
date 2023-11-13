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

/* 
 * GridViewComponentState is the base class for state for GridViewComponentBloc
 */
abstract class GridViewComponentState extends Equatable {
  const GridViewComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * GridViewComponentUninitialized is the uninitialized state of the GridViewComponentBloc 
 */
class GridViewComponentUninitialized extends GridViewComponentState {}

/* 
 * GridViewComponentError is the error state of the GridViewComponentBloc 
 */
class GridViewComponentError extends GridViewComponentState {
  final String? message;
  GridViewComponentError({this.message});
}

/* 
 * GridViewComponentPermissionDenied is to indicate permission denied state of the GridViewComponentBloc 
 */
class GridViewComponentPermissionDenied extends GridViewComponentState {
  GridViewComponentPermissionDenied();
}

/* 
 * GridViewComponentLoaded is used to set the state of the GridViewComponentBloc to the loaded state
 */
class GridViewComponentLoaded extends GridViewComponentState {
  final GridViewModel value;

  /* 
   * construct GridViewComponentLoaded
   */
  const GridViewComponentLoaded({required this.value});

  /* 
   * copy method
   */
  GridViewComponentLoaded copyWith({GridViewModel? copyThis}) {
    return GridViewComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'GridViewComponentLoaded { value: $value }';
}
