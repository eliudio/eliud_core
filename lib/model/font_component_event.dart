/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/font_model.dart';

abstract class FontComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFontComponent extends FontComponentEvent {
  final String? id;

  FetchFontComponent({ this.id });
}

class FontComponentUpdated extends FontComponentEvent {
  final FontModel value;

  FontComponentUpdated({ required this.value });
}


