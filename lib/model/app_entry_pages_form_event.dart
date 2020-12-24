/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_form_event.dart
                       
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
abstract class AppEntryPagesFormEvent extends Equatable {
  const AppEntryPagesFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewAppEntryPagesFormEvent extends AppEntryPagesFormEvent {
}


class InitialiseAppEntryPagesFormEvent extends AppEntryPagesFormEvent {
  final AppEntryPagesModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAppEntryPagesFormEvent({this.value});
}

class InitialiseAppEntryPagesFormNoLoadEvent extends AppEntryPagesFormEvent {
  final AppEntryPagesModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAppEntryPagesFormNoLoadEvent({this.value});
}

class ChangedAppEntryPagesDocumentID extends AppEntryPagesFormEvent {
  final String value;

  ChangedAppEntryPagesDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppEntryPagesDocumentID{ value: $value }';
}

class ChangedAppEntryPagesEntryPage extends AppEntryPagesFormEvent {
  final String value;

  ChangedAppEntryPagesEntryPage({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppEntryPagesEntryPage{ value: $value }';
}

class ChangedAppEntryPagesMinPrivilege extends AppEntryPagesFormEvent {
  final String value;

  ChangedAppEntryPagesMinPrivilege({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppEntryPagesMinPrivilege{ value: $value }';
}

