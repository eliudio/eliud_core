/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class MemberSubscriptionFormEvent extends Equatable {
  const MemberSubscriptionFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewMemberSubscriptionFormEvent extends MemberSubscriptionFormEvent {
}


class InitialiseMemberSubscriptionFormEvent extends MemberSubscriptionFormEvent {
  final MemberSubscriptionModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberSubscriptionFormEvent({this.value});
}

class InitialiseMemberSubscriptionFormNoLoadEvent extends MemberSubscriptionFormEvent {
  final MemberSubscriptionModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberSubscriptionFormNoLoadEvent({this.value});
}

class ChangedMemberSubscriptionDocumentID extends MemberSubscriptionFormEvent {
  final String value;

  ChangedMemberSubscriptionDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberSubscriptionDocumentID{ value: $value }';
}

class ChangedMemberSubscriptionApp extends MemberSubscriptionFormEvent {
  final String value;

  ChangedMemberSubscriptionApp({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberSubscriptionApp{ value: $value }';
}

