/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_public_info_model.dart';

/* 
 * MemberPublicInfoComponentState is the base class for state for MemberPublicInfoComponentBloc
 */
abstract class MemberPublicInfoComponentState extends Equatable {
  const MemberPublicInfoComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * MemberPublicInfoComponentUninitialized is the uninitialized state of the MemberPublicInfoComponentBloc 
 */
class MemberPublicInfoComponentUninitialized
    extends MemberPublicInfoComponentState {}

/* 
 * MemberPublicInfoComponentError is the error state of the MemberPublicInfoComponentBloc 
 */
class MemberPublicInfoComponentError extends MemberPublicInfoComponentState {
  final String? message;
  MemberPublicInfoComponentError({this.message});
}

/* 
 * MemberPublicInfoComponentPermissionDenied is to indicate permission denied state of the MemberPublicInfoComponentBloc 
 */
class MemberPublicInfoComponentPermissionDenied
    extends MemberPublicInfoComponentState {
  MemberPublicInfoComponentPermissionDenied();
}

/* 
 * MemberPublicInfoComponentLoaded is used to set the state of the MemberPublicInfoComponentBloc to the loaded state
 */
class MemberPublicInfoComponentLoaded extends MemberPublicInfoComponentState {
  final MemberPublicInfoModel value;

  /* 
   * construct MemberPublicInfoComponentLoaded
   */
  const MemberPublicInfoComponentLoaded({required this.value});

  /* 
   * copy method
   */
  MemberPublicInfoComponentLoaded copyWith({MemberPublicInfoModel? copyThis}) {
    return MemberPublicInfoComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'MemberPublicInfoComponentLoaded { value: $value }';
}
