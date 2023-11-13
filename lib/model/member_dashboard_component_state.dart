/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';

/* 
 * MemberDashboardComponentState is the base class for state for MemberDashboardComponentBloc
 */
abstract class MemberDashboardComponentState extends Equatable {
  const MemberDashboardComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * MemberDashboardComponentUninitialized is the uninitialized state of the MemberDashboardComponentBloc 
 */
class MemberDashboardComponentUninitialized
    extends MemberDashboardComponentState {}

/* 
 * MemberDashboardComponentError is the error state of the MemberDashboardComponentBloc 
 */
class MemberDashboardComponentError extends MemberDashboardComponentState {
  final String? message;
  MemberDashboardComponentError({this.message});
}

/* 
 * MemberDashboardComponentPermissionDenied is to indicate permission denied state of the MemberDashboardComponentBloc 
 */
class MemberDashboardComponentPermissionDenied
    extends MemberDashboardComponentState {
  MemberDashboardComponentPermissionDenied();
}

/* 
 * MemberDashboardComponentLoaded is used to set the state of the MemberDashboardComponentBloc to the loaded state
 */
class MemberDashboardComponentLoaded extends MemberDashboardComponentState {
  final MemberDashboardModel value;

  /* 
   * construct MemberDashboardComponentLoaded
   */
  const MemberDashboardComponentLoaded({required this.value});

  /* 
   * copy method
   */
  MemberDashboardComponentLoaded copyWith({MemberDashboardModel? copyThis}) {
    return MemberDashboardComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'MemberDashboardComponentLoaded { value: $value }';
}
