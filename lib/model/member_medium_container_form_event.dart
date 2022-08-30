/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_form_event.dart
                       
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
abstract class MemberMediumContainerFormEvent extends Equatable {
  const MemberMediumContainerFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewMemberMediumContainerFormEvent extends MemberMediumContainerFormEvent {
}


class InitialiseMemberMediumContainerFormEvent extends MemberMediumContainerFormEvent {
  final MemberMediumContainerModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseMemberMediumContainerFormEvent({this.value});
}

class InitialiseMemberMediumContainerFormNoLoadEvent extends MemberMediumContainerFormEvent {
  final MemberMediumContainerModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseMemberMediumContainerFormNoLoadEvent({this.value});
}

class ChangedMemberMediumContainerDocumentID extends MemberMediumContainerFormEvent {
  final String? value;

  ChangedMemberMediumContainerDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumContainerDocumentID{ value: $value }';
}

class ChangedMemberMediumContainerHtmlReference extends MemberMediumContainerFormEvent {
  final String? value;

  ChangedMemberMediumContainerHtmlReference({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumContainerHtmlReference{ value: $value }';
}

class ChangedMemberMediumContainerMemberMedium extends MemberMediumContainerFormEvent {
  final String? value;

  ChangedMemberMediumContainerMemberMedium({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedMemberMediumContainerMemberMedium{ value: $value }';
}

