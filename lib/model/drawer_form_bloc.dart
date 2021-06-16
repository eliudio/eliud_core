/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_form_bloc.dart
                       
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

import 'package:eliud_core/model/drawer_form_event.dart';
import 'package:eliud_core/model/drawer_form_state.dart';
import 'package:eliud_core/model/drawer_repository.dart';

class DrawerFormBloc extends Bloc<DrawerFormEvent, DrawerFormState> {
  final FormAction? formAction;
  final String? appId;

  DrawerFormBloc(this.appId, { this.formAction }): super(DrawerFormUninitialized());
  @override
  Stream<DrawerFormState> mapEventToState(DrawerFormEvent event) async* {
    final currentState = state;
    if (currentState is DrawerFormUninitialized) {
      if (event is InitialiseNewDrawerFormEvent) {
        DrawerFormLoaded loaded = DrawerFormLoaded(value: DrawerModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 headerText: "",
                                 secondHeaderText: "",
                                 headerHeight: 0.0,
                                 popupMenuBackgroundColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 popupMenuBackgroundColorOverride: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseDrawerFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DrawerFormLoaded loaded = DrawerFormLoaded(value: await drawerRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseDrawerFormNoLoadEvent) {
        DrawerFormLoaded loaded = DrawerFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is DrawerFormInitialized) {
      DrawerModel? newValue = null;
      if (event is ChangedDrawerDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableDrawerForm(value: newValue);
        }

        return;
      }
      if (event is ChangedDrawerName) {
        newValue = currentState.value!.copyWith(name: event.value);
        yield SubmittableDrawerForm(value: newValue);

        return;
      }
      if (event is ChangedDrawerBackgroundOverride) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(backgroundOverride: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new DrawerModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 name: currentState.value!.name,
                                 backgroundOverride: null,
                                 headerText: currentState.value!.headerText,
                                 secondHeaderText: currentState.value!.secondHeaderText,
                                 headerHeight: currentState.value!.headerHeight,
                                 popupMenuBackgroundColor: currentState.value!.popupMenuBackgroundColor,
                                 headerBackgroundOverride: currentState.value!.headerBackgroundOverride,
                                 popupMenuBackgroundColorOverride: currentState.value!.popupMenuBackgroundColorOverride,
                                 menu: currentState.value!.menu,
          );
        yield SubmittableDrawerForm(value: newValue);

        return;
      }
      if (event is ChangedDrawerHeaderText) {
        newValue = currentState.value!.copyWith(headerText: event.value);
        yield SubmittableDrawerForm(value: newValue);

        return;
      }
      if (event is ChangedDrawerSecondHeaderText) {
        newValue = currentState.value!.copyWith(secondHeaderText: event.value);
        yield SubmittableDrawerForm(value: newValue);

        return;
      }
      if (event is ChangedDrawerHeaderHeight) {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(headerHeight: double.parse(event.value!));
          yield SubmittableDrawerForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(headerHeight: 0.0);
          yield HeaderHeightDrawerFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedDrawerPopupMenuBackgroundColor) {
        newValue = currentState.value!.copyWith(popupMenuBackgroundColor: event.value);
        yield SubmittableDrawerForm(value: newValue);

        return;
      }
      if (event is ChangedDrawerHeaderBackgroundOverride) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(headerBackgroundOverride: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new DrawerModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 name: currentState.value!.name,
                                 backgroundOverride: currentState.value!.backgroundOverride,
                                 headerText: currentState.value!.headerText,
                                 secondHeaderText: currentState.value!.secondHeaderText,
                                 headerHeight: currentState.value!.headerHeight,
                                 popupMenuBackgroundColor: currentState.value!.popupMenuBackgroundColor,
                                 headerBackgroundOverride: null,
                                 popupMenuBackgroundColorOverride: currentState.value!.popupMenuBackgroundColorOverride,
                                 menu: currentState.value!.menu,
          );
        yield SubmittableDrawerForm(value: newValue);

        return;
      }
      if (event is ChangedDrawerPopupMenuBackgroundColorOverride) {
        newValue = currentState.value!.copyWith(popupMenuBackgroundColorOverride: event.value);
        yield SubmittableDrawerForm(value: newValue);

        return;
      }
      if (event is ChangedDrawerMenu) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(menu: await menuDefRepository(appId: appId)!.get(event.value));
        else
          newValue = new DrawerModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 name: currentState.value!.name,
                                 backgroundOverride: currentState.value!.backgroundOverride,
                                 headerText: currentState.value!.headerText,
                                 secondHeaderText: currentState.value!.secondHeaderText,
                                 headerHeight: currentState.value!.headerHeight,
                                 popupMenuBackgroundColor: currentState.value!.popupMenuBackgroundColor,
                                 headerBackgroundOverride: currentState.value!.headerBackgroundOverride,
                                 popupMenuBackgroundColorOverride: currentState.value!.popupMenuBackgroundColorOverride,
                                 menu: null,
          );
        yield SubmittableDrawerForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDDrawerFormError error(String message, DrawerModel newValue) => DocumentIDDrawerFormError(message: message, value: newValue);

  Future<DrawerFormState> _isDocumentIDValid(String? value, DrawerModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DrawerModel?> findDocument = drawerRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDrawerForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

