/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';


@immutable
abstract class BodyComponentFormEvent extends Equatable {
  const BodyComponentFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewBodyComponentFormEvent extends BodyComponentFormEvent {
}


class InitialiseBodyComponentFormEvent extends BodyComponentFormEvent {
  final BodyComponentModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseBodyComponentFormEvent({this.value});
}

class InitialiseBodyComponentFormNoLoadEvent extends BodyComponentFormEvent {
  final BodyComponentModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseBodyComponentFormNoLoadEvent({this.value});
}

class ChangedBodyComponentDocumentID extends BodyComponentFormEvent {
  final String? value;

  ChangedBodyComponentDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBodyComponentDocumentID{ value: $value }';
}

class ChangedBodyComponentComponentName extends BodyComponentFormEvent {
  final String? value;

  ChangedBodyComponentComponentName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBodyComponentComponentName{ value: $value }';
}

class ChangedBodyComponentComponentId extends BodyComponentFormEvent {
  final String? value;

  ChangedBodyComponentComponentId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBodyComponentComponentId{ value: $value }';
}

