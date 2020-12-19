/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_form_event.dart
                       
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
abstract class FontFormEvent extends Equatable {
  const FontFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewFontFormEvent extends FontFormEvent {
}


class InitialiseFontFormEvent extends FontFormEvent {
  final FontModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseFontFormEvent({this.value});
}

class InitialiseFontFormNoLoadEvent extends FontFormEvent {
  final FontModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseFontFormNoLoadEvent({this.value});
}

class ChangedFontDocumentID extends FontFormEvent {
  final String value;

  ChangedFontDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFontDocumentID{ value: $value }';
}

class ChangedFontAppId extends FontFormEvent {
  final String value;

  ChangedFontAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFontAppId{ value: $value }';
}

class ChangedFontFontName extends FontFormEvent {
  final String value;

  ChangedFontFontName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFontFontName{ value: $value }';
}

class ChangedFontSize extends FontFormEvent {
  final String value;

  ChangedFontSize({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFontSize{ value: $value }';
}

class ChangedFontWeight extends FontFormEvent {
  final EliudFontWeight value;

  ChangedFontWeight({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFontWeight{ value: $value }';
}

class ChangedFontStyle extends FontFormEvent {
  final EliudFontStyle value;

  ChangedFontStyle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFontStyle{ value: $value }';
}

class ChangedFontDecoration extends FontFormEvent {
  final EliudFontDecoration value;

  ChangedFontDecoration({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFontDecoration{ value: $value }';
}

class ChangedFontColor extends FontFormEvent {
  final RgbModel value;

  ChangedFontColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedFontColor{ value: $value }';
}

