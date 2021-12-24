/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_form_event.dart
                       
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
abstract class BackgroundFormEvent extends Equatable {
  const BackgroundFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewBackgroundFormEvent extends BackgroundFormEvent {
}


class InitialiseBackgroundFormEvent extends BackgroundFormEvent {
  final BackgroundModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseBackgroundFormEvent({this.value});
}

class InitialiseBackgroundFormNoLoadEvent extends BackgroundFormEvent {
  final BackgroundModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseBackgroundFormNoLoadEvent({this.value});
}

class ChangedBackgroundDocumentID extends BackgroundFormEvent {
  final String? value;

  ChangedBackgroundDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundDocumentID{ value: $value }';
}

class ChangedBackgroundAppId extends BackgroundFormEvent {
  final String? value;

  ChangedBackgroundAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundAppId{ value: $value }';
}

class ChangedBackgroundComments extends BackgroundFormEvent {
  final String? value;

  ChangedBackgroundComments({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundComments{ value: $value }';
}

class ChangedBackgroundBackgroundImage extends BackgroundFormEvent {
  final String? value;

  ChangedBackgroundBackgroundImage({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundBackgroundImage{ value: $value }';
}

class ChangedBackgroundUseProfilePhotoAsBackground extends BackgroundFormEvent {
  final bool? value;

  ChangedBackgroundUseProfilePhotoAsBackground({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundUseProfilePhotoAsBackground{ value: $value }';
}

class ChangedBackgroundBeginGradientPosition extends BackgroundFormEvent {
  final StartGradientPosition? value;

  ChangedBackgroundBeginGradientPosition({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundBeginGradientPosition{ value: $value }';
}

class ChangedBackgroundEndGradientPosition extends BackgroundFormEvent {
  final EndGradientPosition? value;

  ChangedBackgroundEndGradientPosition({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundEndGradientPosition{ value: $value }';
}

class ChangedBackgroundShadow extends BackgroundFormEvent {
  final String? value;

  ChangedBackgroundShadow({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundShadow{ value: $value }';
}

class ChangedBackgroundDecorationColors extends BackgroundFormEvent {
  final List<DecorationColorModel>? value;

  ChangedBackgroundDecorationColors({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundDecorationColors{ value: $value }';
}

class ChangedBackgroundBorder extends BackgroundFormEvent {
  final bool? value;

  ChangedBackgroundBorder({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedBackgroundBorder{ value: $value }';
}

