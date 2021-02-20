/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_form_bloc.dart
                       
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

import 'package:eliud_core/model/background_form_event.dart';
import 'package:eliud_core/model/background_form_state.dart';
import 'package:eliud_core/model/background_repository.dart';

class BackgroundFormBloc extends Bloc<BackgroundFormEvent, BackgroundFormState> {
  final FormAction formAction;
  final String appId;

  BackgroundFormBloc(this.appId, { this.formAction }): super(BackgroundFormUninitialized());
  @override
  Stream<BackgroundFormState> mapEventToState(BackgroundFormEvent event) async* {
    final currentState = state;
    if (currentState is BackgroundFormUninitialized) {
      if (event is InitialiseNewBackgroundFormEvent) {
        BackgroundFormLoaded loaded = BackgroundFormLoaded(value: BackgroundModel(
                                               documentID: "",
                                 appId: "",
                                 comments: "",
                                 decorationColors: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseBackgroundFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        BackgroundFormLoaded loaded = BackgroundFormLoaded(value: await backgroundRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseBackgroundFormNoLoadEvent) {
        BackgroundFormLoaded loaded = BackgroundFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is BackgroundFormInitialized) {
      BackgroundModel newValue = null;
      if (event is ChangedBackgroundDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableBackgroundForm(value: newValue);
        }

        return;
      }
      if (event is ChangedBackgroundComments) {
        newValue = currentState.value.copyWith(comments: event.value);
        yield SubmittableBackgroundForm(value: newValue);

        return;
      }
      if (event is ChangedBackgroundBackgroundImage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(backgroundImage: await memberMediumRepository(appId: appId).get(event.value));
        else
          newValue = new BackgroundModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 comments: currentState.value.comments,
                                 backgroundImage: null,
                                 useProfilePhotoAsBackground: currentState.value.useProfilePhotoAsBackground,
                                 beginGradientPosition: currentState.value.beginGradientPosition,
                                 endGradientPosition: currentState.value.endGradientPosition,
                                 shadow: currentState.value.shadow,
                                 decorationColors: currentState.value.decorationColors,
                                 border: currentState.value.border,
                                 admin: currentState.value.admin,
          );
        yield SubmittableBackgroundForm(value: newValue);

        return;
      }
      if (event is ChangedBackgroundUseProfilePhotoAsBackground) {
        newValue = currentState.value.copyWith(useProfilePhotoAsBackground: event.value);
        yield SubmittableBackgroundForm(value: newValue);

        return;
      }
      if (event is ChangedBackgroundBeginGradientPosition) {
        newValue = currentState.value.copyWith(beginGradientPosition: event.value);
        yield SubmittableBackgroundForm(value: newValue);

        return;
      }
      if (event is ChangedBackgroundEndGradientPosition) {
        newValue = currentState.value.copyWith(endGradientPosition: event.value);
        yield SubmittableBackgroundForm(value: newValue);

        return;
      }
      if (event is ChangedBackgroundShadow) {
        if (event.value != null)
          newValue = currentState.value.copyWith(shadow: await shadowRepository(appId: appId).get(event.value));
        else
          newValue = new BackgroundModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 comments: currentState.value.comments,
                                 backgroundImage: currentState.value.backgroundImage,
                                 useProfilePhotoAsBackground: currentState.value.useProfilePhotoAsBackground,
                                 beginGradientPosition: currentState.value.beginGradientPosition,
                                 endGradientPosition: currentState.value.endGradientPosition,
                                 shadow: null,
                                 decorationColors: currentState.value.decorationColors,
                                 border: currentState.value.border,
                                 admin: currentState.value.admin,
          );
        yield SubmittableBackgroundForm(value: newValue);

        return;
      }
      if (event is ChangedBackgroundDecorationColors) {
        newValue = currentState.value.copyWith(decorationColors: event.value);
        yield SubmittableBackgroundForm(value: newValue);

        return;
      }
      if (event is ChangedBackgroundBorder) {
        newValue = currentState.value.copyWith(border: event.value);
        yield SubmittableBackgroundForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDBackgroundFormError error(String message, BackgroundModel newValue) => DocumentIDBackgroundFormError(message: message, value: newValue);

  Future<BackgroundFormState> _isDocumentIDValid(String value, BackgroundModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<BackgroundModel> findDocument = backgroundRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableBackgroundForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

