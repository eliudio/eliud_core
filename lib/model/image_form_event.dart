/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_form_event.dart
                       
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
abstract class ImageFormEvent extends Equatable {
  const ImageFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewImageFormEvent extends ImageFormEvent {
}


class InitialiseImageFormEvent extends ImageFormEvent {
  final ImageModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseImageFormEvent({this.value});
}

class InitialiseImageFormNoLoadEvent extends ImageFormEvent {
  final ImageModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseImageFormNoLoadEvent({this.value});
}

class ChangedImageDocumentID extends ImageFormEvent {
  final String value;

  ChangedImageDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedImageDocumentID{ value: $value }';
}

class ChangedImageAppId extends ImageFormEvent {
  final String value;

  ChangedImageAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedImageAppId{ value: $value }';
}

class ChangedImageName extends ImageFormEvent {
  final String value;

  ChangedImageName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedImageName{ value: $value }';
}

class ChangedImageSource extends ImageFormEvent {
  final SourceImage value;

  ChangedImageSource({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedImageSource{ value: $value }';
}

class ChangedImageImageURLOriginal extends ImageFormEvent {
  final String value;

  ChangedImageImageURLOriginal({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedImageImageURLOriginal{ value: $value }';
}

class ChangedImageImageURLThumbnail extends ImageFormEvent {
  final String value;

  ChangedImageImageURLThumbnail({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedImageImageURLThumbnail{ value: $value }';
}

