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

abstract class DialogComponentState extends Equatable {
  const DialogComponentState();

  @override
  List<Object?> get props => [];
}

class DialogComponentUninitialized extends DialogComponentState {}

class DialogComponentError extends DialogComponentState {
  final String? message;
  DialogComponentError({ this.message });
}

class DialogComponentPermissionDenied extends DialogComponentState {
  DialogComponentPermissionDenied();
}

class DialogComponentLoaded extends DialogComponentState {
  final DialogModel? value;

  const DialogComponentLoaded({ this.value });

  DialogComponentLoaded copyWith({ DialogModel? copyThis }) {
    return DialogComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DialogComponentLoaded { value: $value }';
}

