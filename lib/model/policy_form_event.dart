/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_form_event.dart
                       
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
abstract class PolicyFormEvent extends Equatable {
  const PolicyFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewPolicyFormEvent extends PolicyFormEvent {
}


class InitialisePolicyFormEvent extends PolicyFormEvent {
  final PolicyModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePolicyFormEvent({this.value});
}

class InitialisePolicyFormNoLoadEvent extends PolicyFormEvent {
  final PolicyModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePolicyFormNoLoadEvent({this.value});
}

class ChangedPolicyDocumentID extends PolicyFormEvent {
  final String value;

  ChangedPolicyDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPolicyDocumentID{ value: $value }';
}

class ChangedPolicyAppId extends PolicyFormEvent {
  final String value;

  ChangedPolicyAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPolicyAppId{ value: $value }';
}

class ChangedPolicyName extends PolicyFormEvent {
  final String value;

  ChangedPolicyName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPolicyName{ value: $value }';
}

class ChangedPolicyHtml extends PolicyFormEvent {
  final String value;

  ChangedPolicyHtml({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPolicyHtml{ value: $value }';
}

