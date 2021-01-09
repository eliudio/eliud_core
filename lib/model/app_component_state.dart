/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AppComponentState extends Equatable {
  const AppComponentState();

  @override
  List<Object> get props => [];
}

class AppComponentUninitialized extends AppComponentState {}

class AppComponentError extends AppComponentState {
  final String message;
  AppComponentError({ this.message });
}

class AppComponentPermissionDenied extends AppComponentState {
  AppComponentPermissionDenied();
}

class AppComponentLoaded extends AppComponentState {
  final AppModel value;

  const AppComponentLoaded({ this.value });

  AppComponentLoaded copyWith({ AppModel copyThis }) {
    return AppComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'AppComponentLoaded { value: $value }';
}

