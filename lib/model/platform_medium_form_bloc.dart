/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
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

import 'package:eliud_core/model/platform_medium_form_event.dart';
import 'package:eliud_core/model/platform_medium_form_state.dart';
import 'package:eliud_core/model/platform_medium_repository.dart';

class PlatformMediumFormBloc extends Bloc<PlatformMediumFormEvent, PlatformMediumFormState> {
  final FormAction? formAction;
  final String? appId;

  PlatformMediumFormBloc(this.appId, { this.formAction }): super(PlatformMediumFormUninitialized());
  @override
  Stream<PlatformMediumFormState> mapEventToState(PlatformMediumFormEvent event) async* {
    final currentState = state;
    if (currentState is PlatformMediumFormUninitialized) {
      if (event is InitialiseNewPlatformMediumFormEvent) {
        PlatformMediumFormLoaded loaded = PlatformMediumFormLoaded(value: PlatformMediumModel(
                                               documentID: "",
                                 appId: "",
                                 authorId: "",
                                 url: "",
                                 ref: "",
                                 urlThumbnail: "",
                                 refThumbnail: "",
                                 mediumWidth: 0,
                                 mediumHeight: 0,
                                 thumbnailWidth: 0,
                                 thumbnailHeight: 0,
                                 relatedMediumId: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePlatformMediumFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PlatformMediumFormLoaded loaded = PlatformMediumFormLoaded(value: await platformMediumRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePlatformMediumFormNoLoadEvent) {
        PlatformMediumFormLoaded loaded = PlatformMediumFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PlatformMediumFormInitialized) {
      PlatformMediumModel? newValue = null;
      if (event is ChangedPlatformMediumDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePlatformMediumForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPlatformMediumAuthorId) {
        newValue = currentState.value!.copyWith(authorId: event.value);
        yield SubmittablePlatformMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPlatformMediumUrl) {
        newValue = currentState.value!.copyWith(url: event.value);
        yield SubmittablePlatformMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPlatformMediumRef) {
        newValue = currentState.value!.copyWith(ref: event.value);
        yield SubmittablePlatformMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPlatformMediumUrlThumbnail) {
        newValue = currentState.value!.copyWith(urlThumbnail: event.value);
        yield SubmittablePlatformMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPlatformMediumRefThumbnail) {
        newValue = currentState.value!.copyWith(refThumbnail: event.value);
        yield SubmittablePlatformMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPlatformMediumConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittablePlatformMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPlatformMediumMediumType) {
        newValue = currentState.value!.copyWith(mediumType: event.value);
        yield SubmittablePlatformMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPlatformMediumMediumWidth) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(mediumWidth: int.parse(event.value!));
          yield SubmittablePlatformMediumForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(mediumWidth: 0);
          yield MediumWidthPlatformMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedPlatformMediumMediumHeight) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(mediumHeight: int.parse(event.value!));
          yield SubmittablePlatformMediumForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(mediumHeight: 0);
          yield MediumHeightPlatformMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedPlatformMediumThumbnailWidth) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(thumbnailWidth: int.parse(event.value!));
          yield SubmittablePlatformMediumForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(thumbnailWidth: 0);
          yield ThumbnailWidthPlatformMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedPlatformMediumThumbnailHeight) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(thumbnailHeight: int.parse(event.value!));
          yield SubmittablePlatformMediumForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(thumbnailHeight: 0);
          yield ThumbnailHeightPlatformMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedPlatformMediumRelatedMediumId) {
        newValue = currentState.value!.copyWith(relatedMediumId: event.value);
        yield SubmittablePlatformMediumForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPlatformMediumFormError error(String message, PlatformMediumModel newValue) => DocumentIDPlatformMediumFormError(message: message, value: newValue);

  Future<PlatformMediumFormState> _isDocumentIDValid(String? value, PlatformMediumModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PlatformMediumModel?> findDocument = platformMediumRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePlatformMediumForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

