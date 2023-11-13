/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';

/* 
 * BlockingDashboardComponentState is the base class for state for BlockingDashboardComponentBloc
 */
abstract class BlockingDashboardComponentState extends Equatable {
  const BlockingDashboardComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * BlockingDashboardComponentUninitialized is the uninitialized state of the BlockingDashboardComponentBloc 
 */
class BlockingDashboardComponentUninitialized
    extends BlockingDashboardComponentState {}

/* 
 * BlockingDashboardComponentError is the error state of the BlockingDashboardComponentBloc 
 */
class BlockingDashboardComponentError extends BlockingDashboardComponentState {
  final String? message;
  BlockingDashboardComponentError({this.message});
}

/* 
 * BlockingDashboardComponentPermissionDenied is to indicate permission denied state of the BlockingDashboardComponentBloc 
 */
class BlockingDashboardComponentPermissionDenied
    extends BlockingDashboardComponentState {
  BlockingDashboardComponentPermissionDenied();
}

/* 
 * BlockingDashboardComponentLoaded is used to set the state of the BlockingDashboardComponentBloc to the loaded state
 */
class BlockingDashboardComponentLoaded extends BlockingDashboardComponentState {
  final BlockingDashboardModel value;

  /* 
   * construct BlockingDashboardComponentLoaded
   */
  const BlockingDashboardComponentLoaded({required this.value});

  /* 
   * copy method
   */
  BlockingDashboardComponentLoaded copyWith(
      {BlockingDashboardModel? copyThis}) {
    return BlockingDashboardComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'BlockingDashboardComponentLoaded { value: $value }';
}
