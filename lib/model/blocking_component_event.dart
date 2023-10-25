/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_model.dart';

abstract class BlockingComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBlockingComponent extends BlockingComponentEvent {
  final String? id;

  FetchBlockingComponent({ this.id });
}

class BlockingComponentUpdated extends BlockingComponentEvent {
  final BlockingModel value;

  BlockingComponentUpdated({ required this.value });
}


