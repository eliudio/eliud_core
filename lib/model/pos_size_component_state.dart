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
import 'pos_size_model.dart';

abstract class PosSizeState extends Equatable {
  const PosSizeState();

  @override
  List<Object> get props => [];
}

class PosSizeUninitialized extends PosSizeState {}

class PosSizeError extends PosSizeState {
  final String message;
  PosSizeError({ this.message });
}

class PosSizeLoaded extends PosSizeState {
  final PosSizeModel value;

  const PosSizeLoaded({ this.value });

  PosSizeLoaded copyWith({ PosSizeModel copyThis }) {
    return PosSizeLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PosSizeModelLoaded { value: $value }';
}


