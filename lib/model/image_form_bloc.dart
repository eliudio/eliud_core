/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/image_form_event.dart';
import 'package:eliud_core/model/image_form_state.dart';
import 'package:eliud_core/model/image_repository.dart';

class ImageFormBloc extends Bloc<ImageFormEvent, ImageFormState> {
  final String appId;

  ImageFormBloc(this.appId, ): super(ImageFormUninitialized());
  @override
  Stream<ImageFormState> mapEventToState(ImageFormEvent event) async* {
    final currentState = state;
    if (currentState is ImageFormUninitialized) {
      if (event is InitialiseNewImageFormEvent) {
        ImageFormLoaded loaded = ImageFormLoaded(value: ImageModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 source: SourceImage.Upload, 
                                 imageURLOriginal: "",
                                 imageURLThumbnail: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseImageFormEvent) {
        ImageFormLoaded loaded = ImageFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseImageFormNoLoadEvent) {
        ImageFormLoaded loaded = ImageFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is ImageFormInitialized) {
      ImageModel newValue = null;
      if (event is ChangedImageDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        yield SubmittableImageForm(value: newValue);

        return;
      }
      if (event is ChangedImageName) {
        newValue = currentState.value.copyWith(name: event.value);
        yield SubmittableImageForm(value: newValue);

        return;
      }
      if (event is ChangedImageSource) {
        newValue = currentState.value.copyWith(source: event.value);
        yield SubmittableImageForm(value: newValue);

        return;
      }
      if (event is ChangedImageImageURLOriginal) {
        newValue = currentState.value.copyWith(imageURLOriginal: event.value);
        yield SubmittableImageForm(value: newValue);

        return;
      }
    }
  }


}

