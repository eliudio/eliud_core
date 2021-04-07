/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_form_bloc.dart
                       
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

import 'package:eliud_core/model/font_form_event.dart';
import 'package:eliud_core/model/font_form_state.dart';
import 'package:eliud_core/model/font_repository.dart';

class FontFormBloc extends Bloc<FontFormEvent, FontFormState> {
  final FormAction? formAction;
  final String? appId;

  FontFormBloc(this.appId, { this.formAction }): super(FontFormUninitialized());
  @override
  Stream<FontFormState> mapEventToState(FontFormEvent event) async* {
    final FontFormState currentState = state;
    if (currentState is FontFormUninitialized) {
      if (event is InitialiseNewFontFormEvent) {
        FontFormLoaded loaded = FontFormLoaded(value: FontModel(
                                               documentID: "",
                                 appId: "",
                                 fontName: "",
                                 size: 20, 
                                 color: RgbModel(r: 255, g: 0, b: 255, opacity: 1.00), 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseFontFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        FontFormLoaded loaded = FontFormLoaded(value: await fontRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseFontFormNoLoadEvent) {
        FontFormLoaded loaded = FontFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is FontFormInitialized) {
      FontModel? newValue = null;
      if (event is ChangedFontDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableFontForm(value: newValue);
        }

        return;
      }
      if (event is ChangedFontFontName) {
        newValue = currentState.value!.copyWith(fontName: event.value);
        yield SubmittableFontForm(value: newValue);

        return;
      }
      if (event is ChangedFontSize) {
        if (isDouble(event.value)) {
          newValue = currentState.value!.copyWith(size: double.parse(event.value!));
          yield SubmittableFontForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(size: 0.0);
          yield SizeFontFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedFontWeight) {
        newValue = currentState.value!.copyWith(weight: event.value);
        yield SubmittableFontForm(value: newValue);

        return;
      }
      if (event is ChangedFontStyle) {
        newValue = currentState.value!.copyWith(style: event.value);
        yield SubmittableFontForm(value: newValue);

        return;
      }
      if (event is ChangedFontDecoration) {
        newValue = currentState.value!.copyWith(decoration: event.value);
        yield SubmittableFontForm(value: newValue);

        return;
      }
      if (event is ChangedFontColor) {
        newValue = currentState.value!.copyWith(color: event.value);
        yield SubmittableFontForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDFontFormError error(String message, FontModel newValue) => DocumentIDFontFormError(message: message, value: newValue);

  Future<FontFormState> _isDocumentIDValid(String? value, FontModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<FontModel?> findDocument = fontRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFontForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

