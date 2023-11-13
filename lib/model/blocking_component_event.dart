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

/*
 * BlockingComponentEvent is the base class for events to be used with constructing a BlockingComponentBloc 
 */
abstract class BlockingComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchBlockingComponent is the event to instruct the bloc to fetch the component
 */
class FetchBlockingComponent extends BlockingComponentEvent {
  final String? id;

  /*
   * Construct the FetchBlockingComponent
   */
  FetchBlockingComponent({this.id});
}

/*
 * BlockingComponentUpdated is the event to inform the bloc that a component has been updated
 */
class BlockingComponentUpdated extends BlockingComponentEvent {
  final BlockingModel value;

  /*
   * Construct the BlockingComponentUpdated
   */
  BlockingComponentUpdated({required this.value});
}
