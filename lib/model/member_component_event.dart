/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_model.dart';

/*
 * MemberComponentEvent is the base class for events to be used with constructing a MemberComponentBloc 
 */
abstract class MemberComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchMemberComponent is the event to instruct the bloc to fetch the component
 */
class FetchMemberComponent extends MemberComponentEvent {
  final String? id;

  /*
   * Construct the FetchMemberComponent
   */
  FetchMemberComponent({this.id});
}

/*
 * MemberComponentUpdated is the event to inform the bloc that a component has been updated
 */
class MemberComponentUpdated extends MemberComponentEvent {
  final MemberModel value;

  /*
   * Construct the MemberComponentUpdated
   */
  MemberComponentUpdated({required this.value});
}
