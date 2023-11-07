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

abstract class MemberComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMemberComponent extends MemberComponentEvent {
  final String? id;

  FetchMemberComponent({this.id});
}

class MemberComponentUpdated extends MemberComponentEvent {
  final MemberModel value;

  MemberComponentUpdated({required this.value});
}
