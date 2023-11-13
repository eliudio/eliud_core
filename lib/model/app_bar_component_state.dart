/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';

/* 
 * AppBarComponentState is the base class for state for AppBarComponentBloc
 */
abstract class AppBarComponentState extends Equatable {
  const AppBarComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * AppBarComponentUninitialized is the uninitialized state of the AppBarComponentBloc 
 */
class AppBarComponentUninitialized extends AppBarComponentState {}

/* 
 * AppBarComponentError is the error state of the AppBarComponentBloc 
 */
class AppBarComponentError extends AppBarComponentState {
  final String? message;
  AppBarComponentError({this.message});
}

/* 
 * AppBarComponentPermissionDenied is to indicate permission denied state of the AppBarComponentBloc 
 */
class AppBarComponentPermissionDenied extends AppBarComponentState {
  AppBarComponentPermissionDenied();
}

/* 
 * AppBarComponentLoaded is used to set the state of the AppBarComponentBloc to the loaded state
 */
class AppBarComponentLoaded extends AppBarComponentState {
  final AppBarModel value;

  /* 
   * construct AppBarComponentLoaded
   */
  const AppBarComponentLoaded({required this.value});

  /* 
   * copy method
   */
  AppBarComponentLoaded copyWith({AppBarModel? copyThis}) {
    return AppBarComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AppBarComponentLoaded { value: $value }';
}
