/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class DialogFormEvent extends Equatable {
  const DialogFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewDialogFormEvent extends DialogFormEvent {
}


class InitialiseDialogFormEvent extends DialogFormEvent {
  final DialogModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseDialogFormEvent({this.value});
}

class InitialiseDialogFormNoLoadEvent extends DialogFormEvent {
  final DialogModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseDialogFormNoLoadEvent({this.value});
}

class ChangedDialogDocumentID extends DialogFormEvent {
  final String value;

  ChangedDialogDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogDocumentID{ value: $value }';
}

class ChangedDialogAppId extends DialogFormEvent {
  final String value;

  ChangedDialogAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogAppId{ value: $value }';
}

class ChangedDialogTitle extends DialogFormEvent {
  final String value;

  ChangedDialogTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogTitle{ value: $value }';
}

class ChangedDialogBodyComponents extends DialogFormEvent {
  final List<BodyComponentModel> value;

  ChangedDialogBodyComponents({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogBodyComponents{ value: $value }';
}

class ChangedDialogBackground extends DialogFormEvent {
  final RgbModel value;

  ChangedDialogBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogBackground{ value: $value }';
}

class ChangedDialogLayout extends DialogFormEvent {
  final DialogLayout value;

  ChangedDialogLayout({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogLayout{ value: $value }';
}

class ChangedDialogGridView extends DialogFormEvent {
  final String value;

  ChangedDialogGridView({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogGridView{ value: $value }';
}

class ChangedDialogReadCondition extends DialogFormEvent {
  final ReadCondition value;

  ChangedDialogReadCondition({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogReadCondition{ value: $value }';
}

class ChangedDialogPrivilegeLevelRequired extends DialogFormEvent {
  final String value;

  ChangedDialogPrivilegeLevelRequired({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogPrivilegeLevelRequired{ value: $value }';
}

class ChangedDialogPackageCondition extends DialogFormEvent {
  final String value;

  ChangedDialogPackageCondition({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDialogPackageCondition{ value: $value }';
}

