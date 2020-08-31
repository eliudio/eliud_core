/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_form_event.dart
                       
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
abstract class PosSizeFormEvent extends Equatable {
  const PosSizeFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewPosSizeFormEvent extends PosSizeFormEvent {
}


class InitialisePosSizeFormEvent extends PosSizeFormEvent {
  final PosSizeModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePosSizeFormEvent({this.value});
}

class InitialisePosSizeFormNoLoadEvent extends PosSizeFormEvent {
  final PosSizeModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePosSizeFormNoLoadEvent({this.value});
}

class ChangedPosSizeDocumentID extends PosSizeFormEvent {
  final String value;

  ChangedPosSizeDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeDocumentID{ value: $value }';
}

class ChangedPosSizeAppId extends PosSizeFormEvent {
  final String value;

  ChangedPosSizeAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeAppId{ value: $value }';
}

class ChangedPosSizeName extends PosSizeFormEvent {
  final String value;

  ChangedPosSizeName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeName{ value: $value }';
}

class ChangedPosSizeWidthPortrait extends PosSizeFormEvent {
  final String value;

  ChangedPosSizeWidthPortrait({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeWidthPortrait{ value: $value }';
}

class ChangedPosSizeWidthTypePortrait extends PosSizeFormEvent {
  final WidthTypePortrait value;

  ChangedPosSizeWidthTypePortrait({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeWidthTypePortrait{ value: $value }';
}

class ChangedPosSizeWidthLandscape extends PosSizeFormEvent {
  final String value;

  ChangedPosSizeWidthLandscape({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeWidthLandscape{ value: $value }';
}

class ChangedPosSizeWidthTypeLandscape extends PosSizeFormEvent {
  final WidthTypeLandscape value;

  ChangedPosSizeWidthTypeLandscape({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeWidthTypeLandscape{ value: $value }';
}

class ChangedPosSizeHeightPortrait extends PosSizeFormEvent {
  final String value;

  ChangedPosSizeHeightPortrait({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeHeightPortrait{ value: $value }';
}

class ChangedPosSizeHeightTypePortrait extends PosSizeFormEvent {
  final HeightTypePortrait value;

  ChangedPosSizeHeightTypePortrait({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeHeightTypePortrait{ value: $value }';
}

class ChangedPosSizeHeightLandscape extends PosSizeFormEvent {
  final String value;

  ChangedPosSizeHeightLandscape({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeHeightLandscape{ value: $value }';
}

class ChangedPosSizeHeightTypeLandscape extends PosSizeFormEvent {
  final HeightTypeLandscape value;

  ChangedPosSizeHeightTypeLandscape({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeHeightTypeLandscape{ value: $value }';
}

class ChangedPosSizeFitPortrait extends PosSizeFormEvent {
  final PortraitFitType value;

  ChangedPosSizeFitPortrait({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeFitPortrait{ value: $value }';
}

class ChangedPosSizeFitLandscape extends PosSizeFormEvent {
  final LandscapeFitType value;

  ChangedPosSizeFitLandscape({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeFitLandscape{ value: $value }';
}

class ChangedPosSizeAlignTypePortrait extends PosSizeFormEvent {
  final PortraitAlignType value;

  ChangedPosSizeAlignTypePortrait({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeAlignTypePortrait{ value: $value }';
}

class ChangedPosSizeAlignTypeLandscape extends PosSizeFormEvent {
  final LandscapeAlignType value;

  ChangedPosSizeAlignTypeLandscape({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeAlignTypeLandscape{ value: $value }';
}

class ChangedPosSizeClip extends PosSizeFormEvent {
  final ClipType value;

  ChangedPosSizeClip({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPosSizeClip{ value: $value }';
}

