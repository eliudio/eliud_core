/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class MemberMediumFormEvent extends Equatable {
  const MemberMediumFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewMemberMediumFormEvent extends MemberMediumFormEvent {
}


class InitialiseMemberMediumFormEvent extends MemberMediumFormEvent {
  final MemberMediumModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberMediumFormEvent({this.value});
}

class InitialiseMemberMediumFormNoLoadEvent extends MemberMediumFormEvent {
  final MemberMediumModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberMediumFormNoLoadEvent({this.value});
}

class ChangedMemberMediumDocumentID extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumDocumentID{ value: $value }';
}

class ChangedMemberMediumAppId extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumAppId{ value: $value }';
}

class ChangedMemberMediumAuthorId extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumAuthorId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumAuthorId{ value: $value }';
}

class ChangedMemberMediumUrl extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumUrl({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumUrl{ value: $value }';
}

class ChangedMemberMediumUrlThumbnail extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumUrlThumbnail({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumUrlThumbnail{ value: $value }';
}

class ChangedMemberMediumReadAccess extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumReadAccess({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumReadAccess{ value: $value }';
}

class ChangedMemberMediumMediumType extends MemberMediumFormEvent {
  final MediumType value;

  ChangedMemberMediumMediumType({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumMediumType{ value: $value }';
}

class ChangedMemberMediumMediumWidth extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumMediumWidth({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumMediumWidth{ value: $value }';
}

class ChangedMemberMediumMediumHeight extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumMediumHeight({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumMediumHeight{ value: $value }';
}

class ChangedMemberMediumThumbnailWidth extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumThumbnailWidth({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumThumbnailWidth{ value: $value }';
}

class ChangedMemberMediumThumbnailHeight extends MemberMediumFormEvent {
  final String value;

  ChangedMemberMediumThumbnailHeight({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumThumbnailHeight{ value: $value }';
}
