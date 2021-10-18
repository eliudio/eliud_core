/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_form_event.dart
                       
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
abstract class PublicMediumFormEvent extends Equatable {
  const PublicMediumFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPublicMediumFormEvent extends PublicMediumFormEvent {
}


class InitialisePublicMediumFormEvent extends PublicMediumFormEvent {
  final PublicMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePublicMediumFormEvent({this.value});
}

class InitialisePublicMediumFormNoLoadEvent extends PublicMediumFormEvent {
  final PublicMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePublicMediumFormNoLoadEvent({this.value});
}

class ChangedPublicMediumDocumentID extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumDocumentID{ value: $value }';
}

class ChangedPublicMediumAuthorId extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumAuthorId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumAuthorId{ value: $value }';
}

class ChangedPublicMediumBaseName extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumBaseName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumBaseName{ value: $value }';
}

class ChangedPublicMediumUrl extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumUrl({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumUrl{ value: $value }';
}

class ChangedPublicMediumRef extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumRef({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumRef{ value: $value }';
}

class ChangedPublicMediumUrlThumbnail extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumUrlThumbnail({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumUrlThumbnail{ value: $value }';
}

class ChangedPublicMediumRefThumbnail extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumRefThumbnail({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumRefThumbnail{ value: $value }';
}

class ChangedPublicMediumMediumType extends PublicMediumFormEvent {
  final PublicMediumType? value;

  ChangedPublicMediumMediumType({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumMediumType{ value: $value }';
}

class ChangedPublicMediumMediumWidth extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumMediumWidth({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumMediumWidth{ value: $value }';
}

class ChangedPublicMediumMediumHeight extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumMediumHeight({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumMediumHeight{ value: $value }';
}

class ChangedPublicMediumThumbnailWidth extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumThumbnailWidth({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumThumbnailWidth{ value: $value }';
}

class ChangedPublicMediumThumbnailHeight extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumThumbnailHeight({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumThumbnailHeight{ value: $value }';
}

class ChangedPublicMediumRelatedMediumId extends PublicMediumFormEvent {
  final String? value;

  ChangedPublicMediumRelatedMediumId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPublicMediumRelatedMediumId{ value: $value }';
}

