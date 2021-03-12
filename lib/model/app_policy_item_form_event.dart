/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_form_event.dart
                       
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
abstract class AppPolicyItemFormEvent extends Equatable {
  const AppPolicyItemFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewAppPolicyItemFormEvent extends AppPolicyItemFormEvent {
}


class InitialiseAppPolicyItemFormEvent extends AppPolicyItemFormEvent {
  final AppPolicyItemModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAppPolicyItemFormEvent({this.value});
}

class InitialiseAppPolicyItemFormNoLoadEvent extends AppPolicyItemFormEvent {
  final AppPolicyItemModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAppPolicyItemFormNoLoadEvent({this.value});
}

class ChangedAppPolicyItemDocumentID extends AppPolicyItemFormEvent {
  final String value;

  ChangedAppPolicyItemDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppPolicyItemDocumentID{ value: $value }';
}

class ChangedAppPolicyItemName extends AppPolicyItemFormEvent {
  final String value;

  ChangedAppPolicyItemName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppPolicyItemName{ value: $value }';
}

class ChangedAppPolicyItemPolicy extends AppPolicyItemFormEvent {
  final String value;

  ChangedAppPolicyItemPolicy({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppPolicyItemPolicy{ value: $value }';
}

