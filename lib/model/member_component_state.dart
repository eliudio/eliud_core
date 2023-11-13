/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_model.dart';

/* 
 * MemberComponentState is the base class for state for MemberComponentBloc
 */
abstract class MemberComponentState extends Equatable {
  const MemberComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * MemberComponentUninitialized is the uninitialized state of the MemberComponentBloc 
 */
class MemberComponentUninitialized extends MemberComponentState {}

/* 
 * MemberComponentError is the error state of the MemberComponentBloc 
 */
class MemberComponentError extends MemberComponentState {
  final String? message;
  MemberComponentError({this.message});
}

/* 
 * MemberComponentPermissionDenied is to indicate permission denied state of the MemberComponentBloc 
 */
class MemberComponentPermissionDenied extends MemberComponentState {
  MemberComponentPermissionDenied();
}

/* 
 * MemberComponentLoaded is used to set the state of the MemberComponentBloc to the loaded state
 */
class MemberComponentLoaded extends MemberComponentState {
  final MemberModel value;

  /* 
   * construct MemberComponentLoaded
   */
  const MemberComponentLoaded({required this.value});

  /* 
   * copy method
   */
  MemberComponentLoaded copyWith({MemberModel? copyThis}) {
    return MemberComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'MemberComponentLoaded { value: $value }';
}
