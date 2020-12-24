/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_form_event.dart
                       
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
abstract class AppBarFormEvent extends Equatable {
  const AppBarFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewAppBarFormEvent extends AppBarFormEvent {
}


class InitialiseAppBarFormEvent extends AppBarFormEvent {
  final AppBarModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAppBarFormEvent({this.value});
}

class InitialiseAppBarFormNoLoadEvent extends AppBarFormEvent {
  final AppBarModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAppBarFormNoLoadEvent({this.value});
}

class ChangedAppBarDocumentID extends AppBarFormEvent {
  final String value;

  ChangedAppBarDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarDocumentID{ value: $value }';
}

class ChangedAppBarAppId extends AppBarFormEvent {
  final String value;

  ChangedAppBarAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarAppId{ value: $value }';
}

class ChangedAppBarTitle extends AppBarFormEvent {
  final String value;

  ChangedAppBarTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarTitle{ value: $value }';
}

class ChangedAppBarHeader extends AppBarFormEvent {
  final HeaderSelection value;

  ChangedAppBarHeader({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarHeader{ value: $value }';
}

class ChangedAppBarIcon extends AppBarFormEvent {
  final IconModel value;

  ChangedAppBarIcon({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarIcon{ value: $value }';
}

class ChangedAppBarImage extends AppBarFormEvent {
  final String value;

  ChangedAppBarImage({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarImage{ value: $value }';
}

class ChangedAppBarIconMenu extends AppBarFormEvent {
  final String value;

  ChangedAppBarIconMenu({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarIconMenu{ value: $value }';
}

class ChangedAppBarBackground extends AppBarFormEvent {
  final String value;

  ChangedAppBarBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarBackground{ value: $value }';
}

class ChangedAppBarIconColor extends AppBarFormEvent {
  final RgbModel value;

  ChangedAppBarIconColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarIconColor{ value: $value }';
}

class ChangedAppBarSelectedIconColor extends AppBarFormEvent {
  final RgbModel value;

  ChangedAppBarSelectedIconColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarSelectedIconColor{ value: $value }';
}

class ChangedAppBarMenuBackgroundColor extends AppBarFormEvent {
  final RgbModel value;

  ChangedAppBarMenuBackgroundColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppBarMenuBackgroundColor{ value: $value }';
}

