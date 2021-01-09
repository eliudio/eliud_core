/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/pos_size_model.dart';

abstract class PosSizeComponentState extends Equatable {
  const PosSizeComponentState();

  @override
  List<Object> get props => [];
}

class PosSizeComponentUninitialized extends PosSizeComponentState {}

class PosSizeComponentError extends PosSizeComponentState {
  final String message;
  PosSizeComponentError({ this.message });
}

class PosSizeComponentPermissionDenied extends PosSizeComponentState {
  PosSizeComponentPermissionDenied();
}

class PosSizeComponentLoaded extends PosSizeComponentState {
  final PosSizeModel value;

  const PosSizeComponentLoaded({ this.value });

  PosSizeComponentLoaded copyWith({ PosSizeModel copyThis }) {
    return PosSizeComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PosSizeComponentLoaded { value: $value }';
}

