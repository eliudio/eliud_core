/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';

/*
 * BlockingDashboardComponentEvent is the base class for events to be used with constructing a BlockingDashboardComponentBloc 
 */
abstract class BlockingDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchBlockingDashboardComponent is the event to instruct the bloc to fetch the component
 */
class FetchBlockingDashboardComponent extends BlockingDashboardComponentEvent {
  final String? id;

  /*
   * Construct the FetchBlockingDashboardComponent
   */
  FetchBlockingDashboardComponent({this.id});
}

/*
 * BlockingDashboardComponentUpdated is the event to inform the bloc that a component has been updated
 */
class BlockingDashboardComponentUpdated
    extends BlockingDashboardComponentEvent {
  final BlockingDashboardModel value;

  /*
   * Construct the BlockingDashboardComponentUpdated
   */
  BlockingDashboardComponentUpdated({required this.value});
}
