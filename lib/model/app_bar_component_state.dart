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

abstract class AppBarComponentState extends Equatable {
  const AppBarComponentState();

  @override
  List<Object> get props => [];
}

class AppBarComponentUninitialized extends AppBarComponentState {}

class AppBarComponentError extends AppBarComponentState {
  final String message;
  AppBarComponentError({ this.message });
}

class AppBarComponentPermissionDenied extends AppBarComponentState {
  AppBarComponentPermissionDenied();
}

class AppBarComponentLoaded extends AppBarComponentState {
  final AppBarModel value;

  const AppBarComponentLoaded({ this.value });

  AppBarComponentLoaded copyWith({ AppBarModel copyThis }) {
    return AppBarComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'AppBarComponentLoaded { value: $value }';
}

