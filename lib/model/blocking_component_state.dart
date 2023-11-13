/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_model.dart';

/* 
 * BlockingComponentState is the base class for state for BlockingComponentBloc
 */
abstract class BlockingComponentState extends Equatable {
  const BlockingComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * BlockingComponentUninitialized is the uninitialized state of the BlockingComponentBloc 
 */
class BlockingComponentUninitialized extends BlockingComponentState {}

/* 
 * BlockingComponentError is the error state of the BlockingComponentBloc 
 */
class BlockingComponentError extends BlockingComponentState {
  final String? message;
  BlockingComponentError({this.message});
}

/* 
 * BlockingComponentPermissionDenied is to indicate permission denied state of the BlockingComponentBloc 
 */
class BlockingComponentPermissionDenied extends BlockingComponentState {
  BlockingComponentPermissionDenied();
}

/* 
 * BlockingComponentLoaded is used to set the state of the BlockingComponentBloc to the loaded state
 */
class BlockingComponentLoaded extends BlockingComponentState {
  final BlockingModel value;

  /* 
   * construct BlockingComponentLoaded
   */
  const BlockingComponentLoaded({required this.value});

  /* 
   * copy method
   */
  BlockingComponentLoaded copyWith({BlockingModel? copyThis}) {
    return BlockingComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'BlockingComponentLoaded { value: $value }';
}
