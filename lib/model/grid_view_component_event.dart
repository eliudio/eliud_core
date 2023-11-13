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

/*
 * GridViewComponentEvent is the base class for events to be used with constructing a GridViewComponentBloc 
 */
abstract class GridViewComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchGridViewComponent is the event to instruct the bloc to fetch the component
 */
class FetchGridViewComponent extends GridViewComponentEvent {
  final String? id;

  /*
   * Construct the FetchGridViewComponent
   */
  FetchGridViewComponent({this.id});
}

/*
 * GridViewComponentUpdated is the event to inform the bloc that a component has been updated
 */
class GridViewComponentUpdated extends GridViewComponentEvent {
  final GridViewModel value;

  /*
   * Construct the GridViewComponentUpdated
   */
  GridViewComponentUpdated({required this.value});
}
