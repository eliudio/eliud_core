/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/pos_size_model.dart';

abstract class PosSizeComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPosSizeComponent extends PosSizeComponentEvent {
  final String? id;

  FetchPosSizeComponent({ this.id });
}

class PosSizeComponentUpdated extends PosSizeComponentEvent {
  final PosSizeModel value;

  PosSizeComponentUpdated({ required this.value });
}


