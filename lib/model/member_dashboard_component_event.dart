/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';

/*
 * MemberDashboardComponentEvent is the base class for events to be used with constructing a MemberDashboardComponentBloc 
 */
abstract class MemberDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchMemberDashboardComponent is the event to instruct the bloc to fetch the component
 */
class FetchMemberDashboardComponent extends MemberDashboardComponentEvent {
  final String? id;

  /*
   * Construct the FetchMemberDashboardComponent
   */
  FetchMemberDashboardComponent({this.id});
}

/*
 * MemberDashboardComponentUpdated is the event to inform the bloc that a component has been updated
 */
class MemberDashboardComponentUpdated extends MemberDashboardComponentEvent {
  final MemberDashboardModel value;

  /*
   * Construct the MemberDashboardComponentUpdated
   */
  MemberDashboardComponentUpdated({required this.value});
}
