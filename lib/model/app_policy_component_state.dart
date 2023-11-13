/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_policy_model.dart';

/* 
 * AppPolicyComponentState is the base class for state for AppPolicyComponentBloc
 */
abstract class AppPolicyComponentState extends Equatable {
  const AppPolicyComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * AppPolicyComponentUninitialized is the uninitialized state of the AppPolicyComponentBloc 
 */
class AppPolicyComponentUninitialized extends AppPolicyComponentState {}

/* 
 * AppPolicyComponentError is the error state of the AppPolicyComponentBloc 
 */
class AppPolicyComponentError extends AppPolicyComponentState {
  final String? message;
  AppPolicyComponentError({this.message});
}

/* 
 * AppPolicyComponentPermissionDenied is to indicate permission denied state of the AppPolicyComponentBloc 
 */
class AppPolicyComponentPermissionDenied extends AppPolicyComponentState {
  AppPolicyComponentPermissionDenied();
}

/* 
 * AppPolicyComponentLoaded is used to set the state of the AppPolicyComponentBloc to the loaded state
 */
class AppPolicyComponentLoaded extends AppPolicyComponentState {
  final AppPolicyModel value;

  /* 
   * construct AppPolicyComponentLoaded
   */
  const AppPolicyComponentLoaded({required this.value});

  /* 
   * copy method
   */
  AppPolicyComponentLoaded copyWith({AppPolicyModel? copyThis}) {
    return AppPolicyComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AppPolicyComponentLoaded { value: $value }';
}
