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

abstract class AppBarState extends Equatable {
  const AppBarState();

  @override
  List<Object> get props => [];
}

class AppBarUninitialized extends AppBarState {}

class AppBarError extends AppBarState {
  final String message;
  AppBarError({ this.message });
}

class AppBarLoaded extends AppBarState {
  final AppBarModel value;

  const AppBarLoaded({ this.value });

  AppBarLoaded copyWith({ AppBarModel copyThis }) {
    return AppBarLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'AppBarModelLoaded { value: $value }';
}


