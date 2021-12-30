/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_form_bloc.dart
                       
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

import 'package:eliud_core/model/public_medium_form_event.dart';
import 'package:eliud_core/model/public_medium_form_state.dart';
import 'package:eliud_core/model/public_medium_repository.dart';

class PublicMediumFormBloc extends Bloc<PublicMediumFormEvent, PublicMediumFormState> {
  final FormAction? formAction;
  final String? appId;

  PublicMediumFormBloc(this.appId, { this.formAction }): super(PublicMediumFormUninitialized());
  @override
  Stream<PublicMediumFormState> mapEventToState(PublicMediumFormEvent event) async* {
    final currentState = state;
    if (currentState is PublicMediumFormUninitialized) {
      if (event is InitialiseNewPublicMediumFormEvent) {
        PublicMediumFormLoaded loaded = PublicMediumFormLoaded(value: PublicMediumModel(
                                               documentID: "",
                                 appId: "",
                                 authorId: "",
                                 baseName: "",
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


      if (event is InitialisePublicMediumFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PublicMediumFormLoaded loaded = PublicMediumFormLoaded(value: await publicMediumRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePublicMediumFormNoLoadEvent) {
        PublicMediumFormLoaded loaded = PublicMediumFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PublicMediumFormInitialized) {
      PublicMediumModel? newValue = null;
      if (event is ChangedPublicMediumDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePublicMediumForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPublicMediumAuthorId) {
        newValue = currentState.value!.copyWith(authorId: event.value);
        yield SubmittablePublicMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPublicMediumBaseName) {
        newValue = currentState.value!.copyWith(baseName: event.value);
        yield SubmittablePublicMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPublicMediumUrl) {
        newValue = currentState.value!.copyWith(url: event.value);
        yield SubmittablePublicMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPublicMediumRef) {
        newValue = currentState.value!.copyWith(ref: event.value);
        yield SubmittablePublicMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPublicMediumUrlThumbnail) {
        newValue = currentState.value!.copyWith(urlThumbnail: event.value);
        yield SubmittablePublicMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPublicMediumRefThumbnail) {
        newValue = currentState.value!.copyWith(refThumbnail: event.value);
        yield SubmittablePublicMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPublicMediumMediumType) {
        newValue = currentState.value!.copyWith(mediumType: event.value);
        yield SubmittablePublicMediumForm(value: newValue);

        return;
      }
      if (event is ChangedPublicMediumMediumWidth) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(mediumWidth: int.parse(event.value!));
          yield SubmittablePublicMediumForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(mediumWidth: 0);
          yield MediumWidthPublicMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedPublicMediumMediumHeight) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(mediumHeight: int.parse(event.value!));
          yield SubmittablePublicMediumForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(mediumHeight: 0);
          yield MediumHeightPublicMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedPublicMediumThumbnailWidth) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(thumbnailWidth: int.parse(event.value!));
          yield SubmittablePublicMediumForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(thumbnailWidth: 0);
          yield ThumbnailWidthPublicMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedPublicMediumThumbnailHeight) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(thumbnailHeight: int.parse(event.value!));
          yield SubmittablePublicMediumForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(thumbnailHeight: 0);
          yield ThumbnailHeightPublicMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedPublicMediumRelatedMediumId) {
        newValue = currentState.value!.copyWith(relatedMediumId: event.value);
        yield SubmittablePublicMediumForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPublicMediumFormError error(String message, PublicMediumModel newValue) => DocumentIDPublicMediumFormError(message: message, value: newValue);

  Future<PublicMediumFormState> _isDocumentIDValid(String? value, PublicMediumModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PublicMediumModel?> findDocument = publicMediumRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePublicMediumForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

