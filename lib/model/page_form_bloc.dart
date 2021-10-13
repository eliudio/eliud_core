/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_form_bloc.dart
                       
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

import 'package:eliud_core/model/page_form_event.dart';
import 'package:eliud_core/model/page_form_state.dart';
import 'package:eliud_core/model/page_repository.dart';

class PageFormBloc extends Bloc<PageFormEvent, PageFormState> {
  final FormAction? formAction;
  final String? appId;

  PageFormBloc(this.appId, { this.formAction }): super(PageFormUninitialized());
  @override
  Stream<PageFormState> mapEventToState(PageFormEvent event) async* {
    final currentState = state;
    if (currentState is PageFormUninitialized) {
      if (event is InitialiseNewPageFormEvent) {
        PageFormLoaded loaded = PageFormLoaded(value: PageModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 bodyComponents: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePageFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PageFormLoaded loaded = PageFormLoaded(value: await pageRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePageFormNoLoadEvent) {
        PageFormLoaded loaded = PageFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PageFormInitialized) {
      PageModel? newValue = null;
      if (event is ChangedPageDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePageForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPageTitle) {
        newValue = currentState.value!.copyWith(title: event.value);
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageAppBar) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(appBar: await appBarRepository(appId: appId)!.get(event.value));
        else
          newValue = new PageModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 appBar: null,
                                 drawer: currentState.value!.drawer,
                                 endDrawer: currentState.value!.endDrawer,
                                 homeMenu: currentState.value!.homeMenu,
                                 bodyComponents: currentState.value!.bodyComponents,
                                 backgroundOverride: currentState.value!.backgroundOverride,
                                 layout: currentState.value!.layout,
                                 gridView: currentState.value!.gridView,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageDrawer) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(drawer: await drawerRepository(appId: appId)!.get(event.value));
        else
          newValue = new PageModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 appBar: currentState.value!.appBar,
                                 drawer: null,
                                 endDrawer: currentState.value!.endDrawer,
                                 homeMenu: currentState.value!.homeMenu,
                                 bodyComponents: currentState.value!.bodyComponents,
                                 backgroundOverride: currentState.value!.backgroundOverride,
                                 layout: currentState.value!.layout,
                                 gridView: currentState.value!.gridView,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageEndDrawer) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(endDrawer: await drawerRepository(appId: appId)!.get(event.value));
        else
          newValue = new PageModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 appBar: currentState.value!.appBar,
                                 drawer: currentState.value!.drawer,
                                 endDrawer: null,
                                 homeMenu: currentState.value!.homeMenu,
                                 bodyComponents: currentState.value!.bodyComponents,
                                 backgroundOverride: currentState.value!.backgroundOverride,
                                 layout: currentState.value!.layout,
                                 gridView: currentState.value!.gridView,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageHomeMenu) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(homeMenu: await homeMenuRepository(appId: appId)!.get(event.value));
        else
          newValue = new PageModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 appBar: currentState.value!.appBar,
                                 drawer: currentState.value!.drawer,
                                 endDrawer: currentState.value!.endDrawer,
                                 homeMenu: null,
                                 bodyComponents: currentState.value!.bodyComponents,
                                 backgroundOverride: currentState.value!.backgroundOverride,
                                 layout: currentState.value!.layout,
                                 gridView: currentState.value!.gridView,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageBodyComponents) {
        newValue = currentState.value!.copyWith(bodyComponents: event.value);
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageBackgroundOverride) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(backgroundOverride: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new PageModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 appBar: currentState.value!.appBar,
                                 drawer: currentState.value!.drawer,
                                 endDrawer: currentState.value!.endDrawer,
                                 homeMenu: currentState.value!.homeMenu,
                                 bodyComponents: currentState.value!.bodyComponents,
                                 backgroundOverride: null,
                                 layout: currentState.value!.layout,
                                 gridView: currentState.value!.gridView,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageLayout) {
        newValue = currentState.value!.copyWith(layout: event.value);
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageGridView) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(gridView: await gridViewRepository(appId: appId)!.get(event.value));
        else
          newValue = new PageModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 appBar: currentState.value!.appBar,
                                 drawer: currentState.value!.drawer,
                                 endDrawer: currentState.value!.endDrawer,
                                 homeMenu: currentState.value!.homeMenu,
                                 bodyComponents: currentState.value!.bodyComponents,
                                 backgroundOverride: currentState.value!.backgroundOverride,
                                 layout: currentState.value!.layout,
                                 gridView: null,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittablePageForm(value: newValue);

        return;
      }
      if (event is ChangedPageConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittablePageForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPageFormError error(String message, PageModel newValue) => DocumentIDPageFormError(message: message, value: newValue);

  Future<PageFormState> _isDocumentIDValid(String? value, PageModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PageModel?> findDocument = pageRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePageForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

