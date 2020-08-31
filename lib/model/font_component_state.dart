/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/font_model.dart';

abstract class FontState extends Equatable {
  const FontState();

  @override
  List<Object> get props => [];
}

class FontUninitialized extends FontState {}

class FontError extends FontState {
  final String message;
  FontError({ this.message });
}

class FontLoaded extends FontState {
  final FontModel value;

  const FontLoaded({ this.value });

  FontLoaded copyWith({ FontModel copyThis }) {
    return FontLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'FontModelLoaded { value: $value }';
}


