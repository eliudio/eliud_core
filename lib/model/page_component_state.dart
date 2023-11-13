/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/page_model.dart';

/* 
 * PageComponentState is the base class for state for PageComponentBloc
 */
abstract class PageComponentState extends Equatable {
  const PageComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * PageComponentUninitialized is the uninitialized state of the PageComponentBloc 
 */
class PageComponentUninitialized extends PageComponentState {}

/* 
 * PageComponentError is the error state of the PageComponentBloc 
 */
class PageComponentError extends PageComponentState {
  final String? message;
  PageComponentError({this.message});
}

/* 
 * PageComponentPermissionDenied is to indicate permission denied state of the PageComponentBloc 
 */
class PageComponentPermissionDenied extends PageComponentState {
  PageComponentPermissionDenied();
}

/* 
 * PageComponentLoaded is used to set the state of the PageComponentBloc to the loaded state
 */
class PageComponentLoaded extends PageComponentState {
  final PageModel value;

  /* 
   * construct PageComponentLoaded
   */
  const PageComponentLoaded({required this.value});

  /* 
   * copy method
   */
  PageComponentLoaded copyWith({PageModel? copyThis}) {
    return PageComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PageComponentLoaded { value: $value }';
}
