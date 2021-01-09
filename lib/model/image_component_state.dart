/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/image_model.dart';

abstract class ImageComponentState extends Equatable {
  const ImageComponentState();

  @override
  List<Object> get props => [];
}

class ImageComponentUninitialized extends ImageComponentState {}

class ImageComponentError extends ImageComponentState {
  final String message;
  ImageComponentError({ this.message });
}

class ImageComponentPermissionDenied extends ImageComponentState {
  ImageComponentPermissionDenied();
}

class ImageComponentLoaded extends ImageComponentState {
  final ImageModel value;

  const ImageComponentLoaded({ this.value });

  ImageComponentLoaded copyWith({ ImageModel copyThis }) {
    return ImageComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'ImageComponentLoaded { value: $value }';
}

