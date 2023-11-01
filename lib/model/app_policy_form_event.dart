/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';


@immutable
abstract class AppPolicyFormEvent extends Equatable {
  const AppPolicyFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewAppPolicyFormEvent extends AppPolicyFormEvent {
}


class InitialiseAppPolicyFormEvent extends AppPolicyFormEvent {
  final AppPolicyModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseAppPolicyFormEvent({this.value});
}

class InitialiseAppPolicyFormNoLoadEvent extends AppPolicyFormEvent {
  final AppPolicyModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseAppPolicyFormNoLoadEvent({this.value});
}

class ChangedAppPolicyDocumentID extends AppPolicyFormEvent {
  final String? value;

  ChangedAppPolicyDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAppPolicyDocumentID{ value: $value }';
}

class ChangedAppPolicyAppId extends AppPolicyFormEvent {
  final String? value;

  ChangedAppPolicyAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAppPolicyAppId{ value: $value }';
}

class ChangedAppPolicyName extends AppPolicyFormEvent {
  final String? value;

  ChangedAppPolicyName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAppPolicyName{ value: $value }';
}

class ChangedAppPolicyPolicy extends AppPolicyFormEvent {
  final String? value;

  ChangedAppPolicyPolicy({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAppPolicyPolicy{ value: $value }';
}

class ChangedAppPolicyConditions extends AppPolicyFormEvent {
  final StorageConditionsModel? value;

  ChangedAppPolicyConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedAppPolicyConditions{ value: $value }';
}

