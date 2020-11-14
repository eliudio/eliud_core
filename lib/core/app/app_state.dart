/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppUninitialized extends AppState {}

class AppError extends AppState {
  final String message;
  AppError({ this.message });
}

class AppLoaded extends AppState {
  final AppModel playStoreApp; // The playstore app. If null, then no playstore app available.
  final AppModel app;

  const AppLoaded({ this.playStoreApp, this.app });

  /*
  AppLoaded copyWith({ AppModel copyThis }) {
    return AppLoaded(playStoreApp: copyThis ?? this.value, value: copyThis ?? this.value);
  }*/

  @override
  List<Object> get props => [playStoreApp, app];

  @override
  String toString() => 'AppLoaded { playStoreApp: $playStoreApp, app: $app }';
}
