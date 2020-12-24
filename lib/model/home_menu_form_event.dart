/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_form_event.dart
                       
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
abstract class HomeMenuFormEvent extends Equatable {
  const HomeMenuFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewHomeMenuFormEvent extends HomeMenuFormEvent {
}


class InitialiseHomeMenuFormEvent extends HomeMenuFormEvent {
  final HomeMenuModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseHomeMenuFormEvent({this.value});
}

class InitialiseHomeMenuFormNoLoadEvent extends HomeMenuFormEvent {
  final HomeMenuModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseHomeMenuFormNoLoadEvent({this.value});
}

class ChangedHomeMenuDocumentID extends HomeMenuFormEvent {
  final String value;

  ChangedHomeMenuDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedHomeMenuDocumentID{ value: $value }';
}

class ChangedHomeMenuAppId extends HomeMenuFormEvent {
  final String value;

  ChangedHomeMenuAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedHomeMenuAppId{ value: $value }';
}

class ChangedHomeMenuName extends HomeMenuFormEvent {
  final String value;

  ChangedHomeMenuName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedHomeMenuName{ value: $value }';
}

class ChangedHomeMenuMenu extends HomeMenuFormEvent {
  final String value;

  ChangedHomeMenuMenu({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedHomeMenuMenu{ value: $value }';
}

class ChangedHomeMenuIconColor extends HomeMenuFormEvent {
  final RgbModel value;

  ChangedHomeMenuIconColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedHomeMenuIconColor{ value: $value }';
}

class ChangedHomeMenuBackground extends HomeMenuFormEvent {
  final String value;

  ChangedHomeMenuBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedHomeMenuBackground{ value: $value }';
}

class ChangedHomeMenuPopupMenuBackgroundColor extends HomeMenuFormEvent {
  final RgbModel value;

  ChangedHomeMenuPopupMenuBackgroundColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedHomeMenuPopupMenuBackgroundColor{ value: $value }';
}

