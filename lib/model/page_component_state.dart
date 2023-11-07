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

abstract class PageComponentState extends Equatable {
  const PageComponentState();

  @override
  List<Object?> get props => [];
}

class PageComponentUninitialized extends PageComponentState {}

class PageComponentError extends PageComponentState {
  final String? message;
  PageComponentError({this.message});
}

class PageComponentPermissionDenied extends PageComponentState {
  PageComponentPermissionDenied();
}

class PageComponentLoaded extends PageComponentState {
  final PageModel value;

  const PageComponentLoaded({required this.value});

  PageComponentLoaded copyWith({PageModel? copyThis}) {
    return PageComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PageComponentLoaded { value: $value }';
}
