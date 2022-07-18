/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_form_bloc.dart
                       
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

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_dashboard_form_event.dart';
import 'package:eliud_core/model/member_dashboard_form_state.dart';
import 'package:eliud_core/model/member_dashboard_repository.dart';

class MemberDashboardFormBloc extends Bloc<MemberDashboardFormEvent, MemberDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  MemberDashboardFormBloc(this.appId, { this.formAction }): super(MemberDashboardFormUninitialized()) {
      on <InitialiseNewMemberDashboardFormEvent> ((event, emit) {
        MemberDashboardFormLoaded loaded = MemberDashboardFormLoaded(value: MemberDashboardModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 updateProfileText: "",
                                 retrieveDataText: "",
                                 deleteDataText: "",
                                 retrieveDataEmailSubject: "",
                                 deleteDataEmailSubject: "",
                                 deleteDataEmailMessage: "",

        ));
        emit(loaded);
      });


      on <InitialiseMemberDashboardFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        MemberDashboardFormLoaded loaded = MemberDashboardFormLoaded(value: await memberDashboardRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseMemberDashboardFormNoLoadEvent> ((event, emit) async {
        MemberDashboardFormLoaded loaded = MemberDashboardFormLoaded(value: event.value);
        emit(loaded);
      });
      MemberDashboardModel? newValue = null;
      on <ChangedMemberDashboardDocumentID> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableMemberDashboardForm(value: newValue));
        }

      }
      });
      on <ChangedMemberDashboardAppId> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
      on <ChangedMemberDashboardDescription> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
      on <ChangedMemberDashboardUpdateProfileText> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(updateProfileText: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
      on <ChangedMemberDashboardRetrieveDataText> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(retrieveDataText: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
      on <ChangedMemberDashboardDeleteDataText> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(deleteDataText: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
      on <ChangedMemberDashboardRetrieveDataEmailSubject> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(retrieveDataEmailSubject: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
      on <ChangedMemberDashboardDeleteDataEmailSubject> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(deleteDataEmailSubject: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
      on <ChangedMemberDashboardDeleteDataEmailMessage> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(deleteDataEmailMessage: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
      on <ChangedMemberDashboardConditions> ((event, emit) async {
      if (state is MemberDashboardFormInitialized) {
        final currentState = state as MemberDashboardFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableMemberDashboardForm(value: newValue));

      }
      });
  }


  DocumentIDMemberDashboardFormError error(String message, MemberDashboardModel newValue) => DocumentIDMemberDashboardFormError(message: message, value: newValue);

  Future<MemberDashboardFormState> _isDocumentIDValid(String? value, MemberDashboardModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<MemberDashboardModel?> findDocument = memberDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableMemberDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

