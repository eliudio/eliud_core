/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_form_event.dart
                       
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
abstract class MenuDefFormEvent extends Equatable {
  const MenuDefFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewMenuDefFormEvent extends MenuDefFormEvent {
}


class InitialiseMenuDefFormEvent extends MenuDefFormEvent {
  final MenuDefModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMenuDefFormEvent({this.value});
}

class InitialiseMenuDefFormNoLoadEvent extends MenuDefFormEvent {
  final MenuDefModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMenuDefFormNoLoadEvent({this.value});
}

class ChangedMenuDefDocumentID extends MenuDefFormEvent {
  final String value;

  ChangedMenuDefDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuDefDocumentID{ value: $value }';
}

class ChangedMenuDefAppId extends MenuDefFormEvent {
  final String value;

  ChangedMenuDefAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuDefAppId{ value: $value }';
}

class ChangedMenuDefName extends MenuDefFormEvent {
  final String value;

  ChangedMenuDefName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuDefName{ value: $value }';
}

class ChangedMenuDefMenuItems extends MenuDefFormEvent {
  final List<MenuItemModel> value;

  ChangedMenuDefMenuItems({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuDefMenuItems{ value: $value }';
}

class ChangedMenuDefAdmin extends MenuDefFormEvent {
  final bool value;

  ChangedMenuDefAdmin({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuDefAdmin{ value: $value }';
}

