/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/dialog_model.dart';

/* 
 * DialogComponentState is the base class for state for DialogComponentBloc
 */
abstract class DialogComponentState extends Equatable {
  const DialogComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * DialogComponentUninitialized is the uninitialized state of the DialogComponentBloc 
 */
class DialogComponentUninitialized extends DialogComponentState {}

/* 
 * DialogComponentError is the error state of the DialogComponentBloc 
 */
class DialogComponentError extends DialogComponentState {
  final String? message;
  DialogComponentError({this.message});
}

/* 
 * DialogComponentPermissionDenied is to indicate permission denied state of the DialogComponentBloc 
 */
class DialogComponentPermissionDenied extends DialogComponentState {
  DialogComponentPermissionDenied();
}

/* 
 * DialogComponentLoaded is used to set the state of the DialogComponentBloc to the loaded state
 */
class DialogComponentLoaded extends DialogComponentState {
  final DialogModel value;

  /* 
   * construct DialogComponentLoaded
   */
  const DialogComponentLoaded({required this.value});

  /* 
   * copy method
   */
  DialogComponentLoaded copyWith({DialogModel? copyThis}) {
    return DialogComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DialogComponentLoaded { value: $value }';
}
