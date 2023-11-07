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

abstract class MemberPublicInfoComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMemberPublicInfoComponent extends MemberPublicInfoComponentEvent {
  final String? id;

  FetchMemberPublicInfoComponent({this.id});
}

class MemberPublicInfoComponentUpdated extends MemberPublicInfoComponentEvent {
  final MemberPublicInfoModel value;

  MemberPublicInfoComponentUpdated({required this.value});
}
