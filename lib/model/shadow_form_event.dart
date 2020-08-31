/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


@immutable
abstract class ShadowFormEvent extends Equatable {
  const ShadowFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewShadowFormEvent extends ShadowFormEvent {
}


class InitialiseShadowFormEvent extends ShadowFormEvent {
  final ShadowModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseShadowFormEvent({this.value});
}

class InitialiseShadowFormNoLoadEvent extends ShadowFormEvent {
  final ShadowModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseShadowFormNoLoadEvent({this.value});
}

class ChangedShadowDocumentID extends ShadowFormEvent {
  final String value;

  ChangedShadowDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShadowDocumentID{ value: $value }';
}

class ChangedShadowAppId extends ShadowFormEvent {
  final String value;

  ChangedShadowAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShadowAppId{ value: $value }';
}

class ChangedShadowComments extends ShadowFormEvent {
  final String value;

  ChangedShadowComments({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShadowComments{ value: $value }';
}

class ChangedShadowColor extends ShadowFormEvent {
  final RgbModel value;

  ChangedShadowColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShadowColor{ value: $value }';
}

class ChangedShadowOffsetDX extends ShadowFormEvent {
  final String value;

  ChangedShadowOffsetDX({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShadowOffsetDX{ value: $value }';
}

class ChangedShadowOffsetDY extends ShadowFormEvent {
  final String value;

  ChangedShadowOffsetDY({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShadowOffsetDY{ value: $value }';
}

class ChangedShadowSpreadRadius extends ShadowFormEvent {
  final String value;

  ChangedShadowSpreadRadius({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShadowSpreadRadius{ value: $value }';
}

class ChangedShadowBlurRadius extends ShadowFormEvent {
  final String value;

  ChangedShadowBlurRadius({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShadowBlurRadius{ value: $value }';
}

