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

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class PageUninitialized extends PageState {}

class PageError extends PageState {
  final String message;
  PageError({ this.message });
}

class PageLoaded extends PageState {
  final PageModel value;

  const PageLoaded({ this.value });

  PageLoaded copyWith({ PageModel copyThis }) {
    return PageLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PageModelLoaded { value: $value }';
}


