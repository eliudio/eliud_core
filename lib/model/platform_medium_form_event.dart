/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_form_event.dart
                       
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
abstract class PlatformMediumFormEvent extends Equatable {
  const PlatformMediumFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPlatformMediumFormEvent extends PlatformMediumFormEvent {
}


class InitialisePlatformMediumFormEvent extends PlatformMediumFormEvent {
  final PlatformMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePlatformMediumFormEvent({this.value});
}

class InitialisePlatformMediumFormNoLoadEvent extends PlatformMediumFormEvent {
  final PlatformMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePlatformMediumFormNoLoadEvent({this.value});
}

class ChangedPlatformMediumDocumentID extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumDocumentID{ value: $value }';
}

class ChangedPlatformMediumAppId extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumAppId{ value: $value }';
}

class ChangedPlatformMediumAuthorId extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumAuthorId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumAuthorId{ value: $value }';
}

class ChangedPlatformMediumUrl extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumUrl({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumUrl{ value: $value }';
}

class ChangedPlatformMediumRef extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumRef({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumRef{ value: $value }';
}

class ChangedPlatformMediumUrlThumbnail extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumUrlThumbnail({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumUrlThumbnail{ value: $value }';
}

class ChangedPlatformMediumRefThumbnail extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumRefThumbnail({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumRefThumbnail{ value: $value }';
}

class ChangedPlatformMediumConditions extends PlatformMediumFormEvent {
  final ConditionsSimpleModel? value;

  ChangedPlatformMediumConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumConditions{ value: $value }';
}

class ChangedPlatformMediumMediumType extends PlatformMediumFormEvent {
  final PlatformMediumType? value;

  ChangedPlatformMediumMediumType({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumMediumType{ value: $value }';
}

class ChangedPlatformMediumMediumWidth extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumMediumWidth({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumMediumWidth{ value: $value }';
}

class ChangedPlatformMediumMediumHeight extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumMediumHeight({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumMediumHeight{ value: $value }';
}

class ChangedPlatformMediumThumbnailWidth extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumThumbnailWidth({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumThumbnailWidth{ value: $value }';
}

class ChangedPlatformMediumThumbnailHeight extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumThumbnailHeight({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumThumbnailHeight{ value: $value }';
}

class ChangedPlatformMediumRelatedMediumId extends PlatformMediumFormEvent {
  final String? value;

  ChangedPlatformMediumRelatedMediumId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPlatformMediumRelatedMediumId{ value: $value }';
}

