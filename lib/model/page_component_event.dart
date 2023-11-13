/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/page_model.dart';

/*
 * PageComponentEvent is the base class for events to be used with constructing a PageComponentBloc 
 */
abstract class PageComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchPageComponent is the event to instruct the bloc to fetch the component
 */
class FetchPageComponent extends PageComponentEvent {
  final String? id;

  /*
   * Construct the FetchPageComponent
   */
  FetchPageComponent({this.id});
}

/*
 * PageComponentUpdated is the event to inform the bloc that a component has been updated
 */
class PageComponentUpdated extends PageComponentEvent {
  final PageModel value;

  /*
   * Construct the PageComponentUpdated
   */
  PageComponentUpdated({required this.value});
}
