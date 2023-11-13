/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_public_info_model.dart';

/*
 * MemberPublicInfoComponentEvent is the base class for events to be used with constructing a MemberPublicInfoComponentBloc 
 */
abstract class MemberPublicInfoComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchMemberPublicInfoComponent is the event to instruct the bloc to fetch the component
 */
class FetchMemberPublicInfoComponent extends MemberPublicInfoComponentEvent {
  final String? id;

  /*
   * Construct the FetchMemberPublicInfoComponent
   */
  FetchMemberPublicInfoComponent({this.id});
}

/*
 * MemberPublicInfoComponentUpdated is the event to inform the bloc that a component has been updated
 */
class MemberPublicInfoComponentUpdated extends MemberPublicInfoComponentEvent {
  final MemberPublicInfoModel value;

  /*
   * Construct the MemberPublicInfoComponentUpdated
   */
  MemberPublicInfoComponentUpdated({required this.value});
}
