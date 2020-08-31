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

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageUninitialized extends ImageState {}

class ImageError extends ImageState {
  final String message;
  ImageError({ this.message });
}

class ImageLoaded extends ImageState {
  final ImageModel value;

  const ImageLoaded({ this.value });

  ImageLoaded copyWith({ ImageModel copyThis }) {
    return ImageLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'ImageModelLoaded { value: $value }';
}


