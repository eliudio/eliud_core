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

abstract class FontComponentState extends Equatable {
  const FontComponentState();

  @override
  List<Object?> get props => [];
}

class FontComponentUninitialized extends FontComponentState {}

class FontComponentError extends FontComponentState {
  final String? message;
  FontComponentError({ this.message });
}

class FontComponentPermissionDenied extends FontComponentState {
  FontComponentPermissionDenied();
}

class FontComponentLoaded extends FontComponentState {
  final FontModel? value;

  const FontComponentLoaded({ this.value });

  FontComponentLoaded copyWith({ FontModel? copyThis }) {
    return FontComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FontComponentLoaded { value: $value }';
}

