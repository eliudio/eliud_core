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
import 'app_model.dart';

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
  final AppModel value;

  const AppLoaded({ this.value });

  AppLoaded copyWith({ AppModel copyThis }) {
    return AppLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'AppModelLoaded { value: $value }';
}


