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
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class DialogFormEvent extends Equatable {
  const DialogFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewDialogFormEvent extends DialogFormEvent {
}


class InitialiseDialogFormEvent extends DialogFormEvent {
  final DialogModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseDialogFormEvent({this.value});
}

class InitialiseDialogFormNoLoadEvent extends DialogFormEvent {
  final DialogModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseDialogFormNoLoadEvent({this.value});
}

class ChangedDialogDocumentID extends DialogFormEvent {
  final String? value;

  ChangedDialogDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogDocumentID{ value: $value }';
}

class ChangedDialogAppId extends DialogFormEvent {
  final String? value;

  ChangedDialogAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogAppId{ value: $value }';
}

class ChangedDialogTitle extends DialogFormEvent {
  final String? value;

  ChangedDialogTitle({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogTitle{ value: $value }';
}

class ChangedDialogDescription extends DialogFormEvent {
  final String? value;

  ChangedDialogDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogDescription{ value: $value }';
}

class ChangedDialogBodyComponents extends DialogFormEvent {
  final List<BodyComponentModel>? value;

  ChangedDialogBodyComponents({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogBodyComponents{ value: $value }';
}

class ChangedDialogBackgroundOverride extends DialogFormEvent {
  final BackgroundModel? value;

  ChangedDialogBackgroundOverride({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogBackgroundOverride{ value: $value }';
}

class ChangedDialogLayout extends DialogFormEvent {
  final DialogLayout? value;

  ChangedDialogLayout({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogLayout{ value: $value }';
}

class ChangedDialogIncludeHeading extends DialogFormEvent {
  final bool? value;

  ChangedDialogIncludeHeading({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogIncludeHeading{ value: $value }';
}

class ChangedDialogGridView extends DialogFormEvent {
  final String? value;

  ChangedDialogGridView({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogGridView{ value: $value }';
}

class ChangedDialogConditions extends DialogFormEvent {
  final StorageConditionsModel? value;

  ChangedDialogConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDialogConditions{ value: $value }';
}

