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
  final FormAction formAction;
  final String appId;

  MemberDashboardFormBloc(this.appId, { this.formAction }): super(MemberDashboardFormUninitialized());
  @override
  Stream<MemberDashboardFormState> mapEventToState(MemberDashboardFormEvent event) async* {
    final currentState = state;
    if (currentState is MemberDashboardFormUninitialized) {
      if (event is InitialiseNewMemberDashboardFormEvent) {
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
        yield loaded;
        return;

      }


      if (event is InitialiseMemberDashboardFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        MemberDashboardFormLoaded loaded = MemberDashboardFormLoaded(value: await memberDashboardRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseMemberDashboardFormNoLoadEvent) {
        MemberDashboardFormLoaded loaded = MemberDashboardFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is MemberDashboardFormInitialized) {
      MemberDashboardModel newValue = null;
      if (event is ChangedMemberDashboardDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableMemberDashboardForm(value: newValue);
        }

        return;
      }
      if (event is ChangedMemberDashboardAppId) {
        newValue = currentState.value.copyWith(appId: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedMemberDashboardDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedMemberDashboardUpdateProfileText) {
        newValue = currentState.value.copyWith(updateProfileText: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedMemberDashboardRetrieveDataText) {
        newValue = currentState.value.copyWith(retrieveDataText: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedMemberDashboardDeleteDataText) {
        newValue = currentState.value.copyWith(deleteDataText: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedMemberDashboardRetrieveDataEmailSubject) {
        newValue = currentState.value.copyWith(retrieveDataEmailSubject: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedMemberDashboardDeleteDataEmailSubject) {
        newValue = currentState.value.copyWith(deleteDataEmailSubject: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedMemberDashboardDeleteDataEmailMessage) {
        newValue = currentState.value.copyWith(deleteDataEmailMessage: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
      if (event is ChangedMemberDashboardConditions) {
        newValue = currentState.value.copyWith(conditions: event.value);
        yield SubmittableMemberDashboardForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDMemberDashboardFormError error(String message, MemberDashboardModel newValue) => DocumentIDMemberDashboardFormError(message: message, value: newValue);

  Future<MemberDashboardFormState> _isDocumentIDValid(String value, MemberDashboardModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<MemberDashboardModel> findDocument = memberDashboardRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableMemberDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

