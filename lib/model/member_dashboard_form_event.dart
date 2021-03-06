/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class MemberDashboardFormEvent extends Equatable {
  const MemberDashboardFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewMemberDashboardFormEvent extends MemberDashboardFormEvent {
}


class InitialiseMemberDashboardFormEvent extends MemberDashboardFormEvent {
  final MemberDashboardModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberDashboardFormEvent({this.value});
}

class InitialiseMemberDashboardFormNoLoadEvent extends MemberDashboardFormEvent {
  final MemberDashboardModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberDashboardFormNoLoadEvent({this.value});
}

class ChangedMemberDashboardDocumentID extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardDocumentID{ value: $value }';
}

class ChangedMemberDashboardAppId extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardAppId{ value: $value }';
}

class ChangedMemberDashboardDescription extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardDescription{ value: $value }';
}

class ChangedMemberDashboardUpdateProfileText extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardUpdateProfileText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardUpdateProfileText{ value: $value }';
}

class ChangedMemberDashboardRetrieveDataText extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardRetrieveDataText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardRetrieveDataText{ value: $value }';
}

class ChangedMemberDashboardDeleteDataText extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardDeleteDataText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardDeleteDataText{ value: $value }';
}

class ChangedMemberDashboardRetrieveDataEmailSubject extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardRetrieveDataEmailSubject({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardRetrieveDataEmailSubject{ value: $value }';
}

class ChangedMemberDashboardDeleteDataEmailSubject extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardDeleteDataEmailSubject({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardDeleteDataEmailSubject{ value: $value }';
}

class ChangedMemberDashboardDeleteDataEmailMessage extends MemberDashboardFormEvent {
  final String value;

  ChangedMemberDashboardDeleteDataEmailMessage({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardDeleteDataEmailMessage{ value: $value }';
}

class ChangedMemberDashboardConditions extends MemberDashboardFormEvent {
  final ConditionsSimpleModel value;

  ChangedMemberDashboardConditions({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDashboardConditions{ value: $value }';
}

