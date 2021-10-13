/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/grid_view_model.dart';

abstract class GridViewComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchGridViewComponent extends GridViewComponentEvent {
  final String? id;

  FetchGridViewComponent({ this.id });
}

class GridViewComponentUpdated extends GridViewComponentEvent {
  final GridViewModel value;

  GridViewComponentUpdated({ required this.value });
}


