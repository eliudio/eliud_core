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

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/page_form_event.dart';
import 'package:eliud_core/model/page_form_state.dart';

class PageFormBloc extends Bloc<PageFormEvent, PageFormState> {
  final FormAction? formAction;
  final String? appId;

  PageFormBloc(this.appId, {this.formAction}) : super(PageFormUninitialized()) {
    on<InitialiseNewPageFormEvent>((event, emit) {
      PageFormLoaded loaded = PageFormLoaded(
          value: PageModel(
        documentID: "",
        appId: "",
        description: "",
        title: "",
        bodyComponents: [],
      ));
      emit(loaded);
    });

    on<InitialisePageFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      PageFormLoaded loaded = PageFormLoaded(
          value:
              await pageRepository(appId: appId)!.get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialisePageFormNoLoadEvent>((event, emit) async {
      PageFormLoaded loaded = PageFormLoaded(value: event.value);
      emit(loaded);
    });
    PageModel? newValue;
    on<ChangedPageDocumentID>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePageForm(value: newValue));
        }
      }
    });
    on<ChangedPageDescription>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageTitle>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageAppBar>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              appBar: await appBarRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageDrawer>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              drawer: await drawerRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageEndDrawer>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              endDrawer:
                  await drawerRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageHomeMenu>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              homeMenu:
                  await homeMenuRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageBodyComponents>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        newValue = currentState.value!.copyWith(bodyComponents: event.value);
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageBackgroundOverride>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        newValue =
            currentState.value!.copyWith(backgroundOverride: event.value);
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageLayout>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        newValue = currentState.value!.copyWith(layout: event.value);
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageGridView>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              gridView:
                  await gridViewRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittablePageForm(value: newValue));
      }
    });
    on<ChangedPageConditions>((event, emit) async {
      if (state is PageFormInitialized) {
        final currentState = state as PageFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittablePageForm(value: newValue));
      }
    });
  }

  DocumentIDPageFormError error(String message, PageModel newValue) =>
      DocumentIDPageFormError(message: message, value: newValue);

  Future<PageFormState> _isDocumentIDValid(
      String? value, PageModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
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
