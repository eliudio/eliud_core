/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchImage extends ImageEvent {
  final String id;

  FetchImage({ this.id });
}

