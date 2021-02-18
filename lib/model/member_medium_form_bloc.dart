/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_form_bloc.dart
                       
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

import 'package:eliud_core/model/member_medium_form_event.dart';
import 'package:eliud_core/model/member_medium_form_state.dart';
import 'package:eliud_core/model/member_medium_repository.dart';

class MemberMediumFormBloc extends Bloc<MemberMediumFormEvent, MemberMediumFormState> {
  final FormAction formAction;
  final String appId;

  MemberMediumFormBloc(this.appId, { this.formAction }): super(MemberMediumFormUninitialized());
  @override
  Stream<MemberMediumFormState> mapEventToState(MemberMediumFormEvent event) async* {
    final currentState = state;
    if (currentState is MemberMediumFormUninitialized) {
      if (event is InitialiseNewMemberMediumFormEvent) {
        MemberMediumFormLoaded loaded = MemberMediumFormLoaded(value: MemberMediumModel(
                                               documentID: "",
                                 appId: "",
                                 authorId: "",
                                 url: "",
                                 urlThumbnail: "",
                                 readAccess: [],
                                 mediumWidth: 0,
                                 mediumHeight: 0,
                                 thumbnailWidth: 0,
                                 thumbnailHeight: 0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseMemberMediumFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        MemberMediumFormLoaded loaded = MemberMediumFormLoaded(value: await memberMediumRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseMemberMediumFormNoLoadEvent) {
        MemberMediumFormLoaded loaded = MemberMediumFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is MemberMediumFormInitialized) {
      MemberMediumModel newValue = null;
      if (event is ChangedMemberMediumDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableMemberMediumForm(value: newValue);
        }

        return;
      }
      if (event is ChangedMemberMediumAuthorId) {
        newValue = currentState.value.copyWith(authorId: event.value);
        yield SubmittableMemberMediumForm(value: newValue);

        return;
      }
      if (event is ChangedMemberMediumUrl) {
        newValue = currentState.value.copyWith(url: event.value);
        yield SubmittableMemberMediumForm(value: newValue);

        return;
      }
      if (event is ChangedMemberMediumUrlThumbnail) {
        newValue = currentState.value.copyWith(urlThumbnail: event.value);
        yield SubmittableMemberMediumForm(value: newValue);

        return;
      }
      if (event is ChangedMemberMediumMediumType) {
        newValue = currentState.value.copyWith(mediumType: event.value);
        yield SubmittableMemberMediumForm(value: newValue);

        return;
      }
      if (event is ChangedMemberMediumMediumWidth) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(mediumWidth: int.parse(event.value));
          yield SubmittableMemberMediumForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(mediumWidth: 0);
          yield MediumWidthMemberMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedMemberMediumMediumHeight) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(mediumHeight: int.parse(event.value));
          yield SubmittableMemberMediumForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(mediumHeight: 0);
          yield MediumHeightMemberMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedMemberMediumThumbnailWidth) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(thumbnailWidth: int.parse(event.value));
          yield SubmittableMemberMediumForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(thumbnailWidth: 0);
          yield ThumbnailWidthMemberMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedMemberMediumThumbnailHeight) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(thumbnailHeight: int.parse(event.value));
          yield SubmittableMemberMediumForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(thumbnailHeight: 0);
          yield ThumbnailHeightMemberMediumFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
    }
  }


  DocumentIDMemberMediumFormError error(String message, MemberMediumModel newValue) => DocumentIDMemberMediumFormError(message: message, value: newValue);

  Future<MemberMediumFormState> _isDocumentIDValid(String value, MemberMediumModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<MemberMediumModel> findDocument = memberMediumRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableMemberMediumForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

