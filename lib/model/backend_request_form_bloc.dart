/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_form_bloc.dart
                       
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

import 'package:eliud_core/model/backend_request_form_event.dart';
import 'package:eliud_core/model/backend_request_form_state.dart';
import 'package:eliud_core/model/backend_request_repository.dart';

class BackendRequestFormBloc extends Bloc<BackendRequestFormEvent, BackendRequestFormState> {
  final FormAction? formAction;
  final String? appId;

  BackendRequestFormBloc(this.appId, { this.formAction }): super(BackendRequestFormUninitialized());
  @override
  Stream<BackendRequestFormState> mapEventToState(BackendRequestFormEvent event) async* {
    final currentState = state;
    if (currentState is BackendRequestFormUninitialized) {
      on <InitialiseNewBackendRequestFormEvent> ((event, emit) {
        BackendRequestFormLoaded loaded = BackendRequestFormLoaded(value: BackendRequestModel(
                                               documentID: "",
                                 description: "",
                                 appId: "",
                                 authorId: "",
                                 name: "",
                                 sendTo: "",
                                 requestType: RequestType.RequestEmailData, 

        ));
        emit(loaded);
      });


      if (event is InitialiseBackendRequestFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        BackendRequestFormLoaded loaded = BackendRequestFormLoaded(value: await backendRequestRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseBackendRequestFormNoLoadEvent) {
        BackendRequestFormLoaded loaded = BackendRequestFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is BackendRequestFormInitialized) {
      BackendRequestModel? newValue = null;
      on <ChangedBackendRequestDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableBackendRequestForm(value: newValue));
        }

      });
      on <ChangedBackendRequestDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));

      });
      on <ChangedBackendRequestAuthorId> ((event, emit) async {
        newValue = currentState.value!.copyWith(authorId: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));

      });
      on <ChangedBackendRequestName> ((event, emit) async {
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));

      });
      on <ChangedBackendRequestSendTo> ((event, emit) async {
        newValue = currentState.value!.copyWith(sendTo: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));

      });
      on <ChangedBackendRequestCollections> ((event, emit) async {
        newValue = currentState.value!.copyWith(collections: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));

      });
      on <ChangedBackendRequestProcessed> ((event, emit) async {
        newValue = currentState.value!.copyWith(processed: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));

      });
      on <ChangedBackendRequestRequestType> ((event, emit) async {
        newValue = currentState.value!.copyWith(requestType: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));

      });
    }
  }


  DocumentIDBackendRequestFormError error(String message, BackendRequestModel newValue) => DocumentIDBackendRequestFormError(message: message, value: newValue);

  Future<BackendRequestFormState> _isDocumentIDValid(String? value, BackendRequestModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<BackendRequestModel?> findDocument = backendRequestRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableBackendRequestForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

