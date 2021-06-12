/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';

abstract class EliudStyleAttributesComponentState extends Equatable {
  const EliudStyleAttributesComponentState();

  @override
  List<Object?> get props => [];
}

class EliudStyleAttributesComponentUninitialized extends EliudStyleAttributesComponentState {}

class EliudStyleAttributesComponentError extends EliudStyleAttributesComponentState {
  final String? message;
  EliudStyleAttributesComponentError({ this.message });
}

class EliudStyleAttributesComponentPermissionDenied extends EliudStyleAttributesComponentState {
  EliudStyleAttributesComponentPermissionDenied();
}

class EliudStyleAttributesComponentLoaded extends EliudStyleAttributesComponentState {
  final EliudStyleAttributesModel? value;

  const EliudStyleAttributesComponentLoaded({ this.value });

  EliudStyleAttributesComponentLoaded copyWith({ EliudStyleAttributesModel? copyThis }) {
    return EliudStyleAttributesComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'EliudStyleAttributesComponentLoaded { value: $value }';
}

