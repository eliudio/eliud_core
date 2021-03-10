/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_form_bloc.dart
                       
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

import 'package:eliud_core/model/policy_form_event.dart';
import 'package:eliud_core/model/policy_form_state.dart';
import 'package:eliud_core/model/policy_repository.dart';

class PolicyFormBloc extends Bloc<PolicyFormEvent, PolicyFormState> {
  final FormAction formAction;
  final String appId;

  PolicyFormBloc(this.appId, { this.formAction }): super(PolicyFormUninitialized());
  @override
  Stream<PolicyFormState> mapEventToState(PolicyFormEvent event) async* {
    final currentState = state;
    if (currentState is PolicyFormUninitialized) {
      if (event is InitialiseNewPolicyFormEvent) {
        PolicyFormLoaded loaded = PolicyFormLoaded(value: PolicyModel(
                                               documentID: "IDENTIFIER", 
                                 appId: "",
                                 name: "",
                                 html: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePolicyFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PolicyFormLoaded loaded = PolicyFormLoaded(value: await policyRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePolicyFormNoLoadEvent) {
        PolicyFormLoaded loaded = PolicyFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PolicyFormInitialized) {
      PolicyModel newValue = null;
      if (event is ChangedPolicyDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePolicyForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPolicyName) {
        newValue = currentState.value.copyWith(name: event.value);
        yield SubmittablePolicyForm(value: newValue);

        return;
      }
      if (event is ChangedPolicyHtml) {
        newValue = currentState.value.copyWith(html: event.value);
        yield SubmittablePolicyForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPolicyFormError error(String message, PolicyModel newValue) => DocumentIDPolicyFormError(message: message, value: newValue);

  Future<PolicyFormState> _isDocumentIDValid(String value, PolicyModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PolicyModel> findDocument = policyRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePolicyForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

