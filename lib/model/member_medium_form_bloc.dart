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

import 'package:eliud_core/model/member_medium_form_event.dart';
import 'package:eliud_core/model/member_medium_form_state.dart';
import 'package:eliud_core/model/member_medium_repository.dart';

class MemberMediumFormBloc extends Bloc<MemberMediumFormEvent, MemberMediumFormState> {
  final FormAction? formAction;
  final String? appId;

  MemberMediumFormBloc(this.appId, { this.formAction }): super(MemberMediumFormUninitialized()) {
      on <InitialiseNewMemberMediumFormEvent> ((event, emit) {
        MemberMediumFormLoaded loaded = MemberMediumFormLoaded(value: MemberMediumModel(
                                               documentID: "",
                                 appId: "",
                                 authorId: "",
                                 base: "",
                                 ext: "",
                                 url: "",
                                 ref: "",
                                 urlThumbnail: "",
                                 refThumbnail: "",
                                 accessibleByMembers: [],
                                 readAccess: [],
                                 mediumWidth: 0,
                                 mediumHeight: 0,
                                 thumbnailWidth: 0,
                                 thumbnailHeight: 0,
                                 relatedMediumId: "",

        ));
        emit(loaded);
      });


      on <InitialiseMemberMediumFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        MemberMediumFormLoaded loaded = MemberMediumFormLoaded(value: await memberMediumRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseMemberMediumFormNoLoadEvent> ((event, emit) async {
        MemberMediumFormLoaded loaded = MemberMediumFormLoaded(value: event.value);
        emit(loaded);
      });
      MemberMediumModel? newValue = null;
      on <ChangedMemberMediumDocumentID> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableMemberMediumForm(value: newValue));
        }

      }
      });
      on <ChangedMemberMediumAuthorId> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(authorId: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumBase> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(base: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumExt> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(ext: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumUrl> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(url: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumRef> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(ref: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumUrlThumbnail> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(urlThumbnail: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumRefThumbnail> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(refThumbnail: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumAccessibleByGroup> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(accessibleByGroup: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumMediumType> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(mediumType: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
      on <ChangedMemberMediumMediumWidth> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(mediumWidth: int.parse(event.value!));
          emit(SubmittableMemberMediumForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(mediumWidth: 0);
          emit(MediumWidthMemberMediumFormError(message: "Value should be a number", value: newValue));
        }
      }
      });
      on <ChangedMemberMediumMediumHeight> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(mediumHeight: int.parse(event.value!));
          emit(SubmittableMemberMediumForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(mediumHeight: 0);
          emit(MediumHeightMemberMediumFormError(message: "Value should be a number", value: newValue));
        }
      }
      });
      on <ChangedMemberMediumThumbnailWidth> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(thumbnailWidth: int.parse(event.value!));
          emit(SubmittableMemberMediumForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(thumbnailWidth: 0);
          emit(ThumbnailWidthMemberMediumFormError(message: "Value should be a number", value: newValue));
        }
      }
      });
      on <ChangedMemberMediumThumbnailHeight> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(thumbnailHeight: int.parse(event.value!));
          emit(SubmittableMemberMediumForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(thumbnailHeight: 0);
          emit(ThumbnailHeightMemberMediumFormError(message: "Value should be a number", value: newValue));
        }
      }
      });
      on <ChangedMemberMediumRelatedMediumId> ((event, emit) async {
      if (state is MemberMediumFormInitialized) {
        final currentState = state as MemberMediumFormInitialized;
        newValue = currentState.value!.copyWith(relatedMediumId: event.value);
        emit(SubmittableMemberMediumForm(value: newValue));

      }
      });
  }


  DocumentIDMemberMediumFormError error(String message, MemberMediumModel newValue) => DocumentIDMemberMediumFormError(message: message, value: newValue);

  Future<MemberMediumFormState> _isDocumentIDValid(String? value, MemberMediumModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<MemberMediumModel?> findDocument = memberMediumRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableMemberMediumForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

