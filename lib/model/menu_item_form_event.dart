/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class MenuItemFormEvent extends Equatable {
  const MenuItemFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewMenuItemFormEvent extends MenuItemFormEvent {
}


class InitialiseMenuItemFormEvent extends MenuItemFormEvent {
  final MenuItemModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMenuItemFormEvent({this.value});
}

class InitialiseMenuItemFormNoLoadEvent extends MenuItemFormEvent {
  final MenuItemModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMenuItemFormNoLoadEvent({this.value});
}

class ChangedMenuItemDocumentID extends MenuItemFormEvent {
  final String value;

  ChangedMenuItemDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuItemDocumentID{ value: $value }';
}

class ChangedMenuItemText extends MenuItemFormEvent {
  final String value;

  ChangedMenuItemText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuItemText{ value: $value }';
}

class ChangedMenuItemDescription extends MenuItemFormEvent {
  final String value;

  ChangedMenuItemDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuItemDescription{ value: $value }';
}

class ChangedMenuItemIcon extends MenuItemFormEvent {
  final IconModel value;

  ChangedMenuItemIcon({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuItemIcon{ value: $value }';
}

class ChangedMenuItemAction extends MenuItemFormEvent {
  final ActionModel value;

  ChangedMenuItemAction({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMenuItemAction{ value: $value }';
}

