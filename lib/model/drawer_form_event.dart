/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class DrawerFormEvent extends Equatable {
  const DrawerFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewDrawerFormEvent extends DrawerFormEvent {
}


class InitialiseDrawerFormEvent extends DrawerFormEvent {
  final DrawerModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseDrawerFormEvent({this.value});
}

class InitialiseDrawerFormNoLoadEvent extends DrawerFormEvent {
  final DrawerModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseDrawerFormNoLoadEvent({this.value});
}

class ChangedDrawerDocumentID extends DrawerFormEvent {
  final String value;

  ChangedDrawerDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerDocumentID{ value: $value }';
}

class ChangedDrawerAppId extends DrawerFormEvent {
  final String value;

  ChangedDrawerAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerAppId{ value: $value }';
}

class ChangedDrawerName extends DrawerFormEvent {
  final String value;

  ChangedDrawerName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerName{ value: $value }';
}

class ChangedDrawerBackground extends DrawerFormEvent {
  final String value;

  ChangedDrawerBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerBackground{ value: $value }';
}

class ChangedDrawerHeaderText extends DrawerFormEvent {
  final String value;

  ChangedDrawerHeaderText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerHeaderText{ value: $value }';
}

class ChangedDrawerSecondHeaderText extends DrawerFormEvent {
  final String value;

  ChangedDrawerSecondHeaderText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerSecondHeaderText{ value: $value }';
}

class ChangedDrawerHeaderHeight extends DrawerFormEvent {
  final String value;

  ChangedDrawerHeaderHeight({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerHeaderHeight{ value: $value }';
}

class ChangedDrawerPopupMenuBackgroundColor extends DrawerFormEvent {
  final RgbModel value;

  ChangedDrawerPopupMenuBackgroundColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerPopupMenuBackgroundColor{ value: $value }';
}

class ChangedDrawerHeaderBackground extends DrawerFormEvent {
  final String value;

  ChangedDrawerHeaderBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerHeaderBackground{ value: $value }';
}

class ChangedDrawerMenu extends DrawerFormEvent {
  final String value;

  ChangedDrawerMenu({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDrawerMenu{ value: $value }';
}

