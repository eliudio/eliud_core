/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/public_medium_form_event.dart';
import 'package:eliud_core/model/public_medium_form_state.dart';

class PublicMediumFormBloc
    extends Bloc<PublicMediumFormEvent, PublicMediumFormState> {
  final FormAction? formAction;
  final String? appId;

  PublicMediumFormBloc(this.appId, {this.formAction})
      : super(PublicMediumFormUninitialized()) {
    on<InitialiseNewPublicMediumFormEvent>((event, emit) {
      PublicMediumFormLoaded loaded = PublicMediumFormLoaded(
          value: PublicMediumModel(
        documentID: "",
        authorId: "",
        base: "",
        ext: "",
        url: "",
        ref: "",
        urlThumbnail: "",
        refThumbnail: "",
        mediumWidth: 0,
        mediumHeight: 0,
        thumbnailWidth: 0,
        thumbnailHeight: 0,
        relatedMediumId: "",
      ));
      emit(loaded);
    });

    on<InitialisePublicMediumFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      PublicMediumFormLoaded loaded = PublicMediumFormLoaded(
          value: await publicMediumRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialisePublicMediumFormNoLoadEvent>((event, emit) async {
      PublicMediumFormLoaded loaded =
          PublicMediumFormLoaded(value: event.value);
      emit(loaded);
    });
    PublicMediumModel? newValue;
    on<ChangedPublicMediumDocumentID>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePublicMediumForm(value: newValue));
        }
      }
    });
    on<ChangedPublicMediumAuthorId>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(authorId: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
    on<ChangedPublicMediumBase>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(base: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
    on<ChangedPublicMediumExt>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(ext: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
    on<ChangedPublicMediumUrl>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(url: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
    on<ChangedPublicMediumRef>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(ref: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
    on<ChangedPublicMediumUrlThumbnail>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(urlThumbnail: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
    on<ChangedPublicMediumRefThumbnail>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(refThumbnail: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
    on<ChangedPublicMediumMediumType>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(mediumType: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
    on<ChangedPublicMediumMediumWidth>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(mediumWidth: int.parse(event.value!));
          emit(SubmittablePublicMediumForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(mediumWidth: 0);
          emit(MediumWidthPublicMediumFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPublicMediumMediumHeight>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(mediumHeight: int.parse(event.value!));
          emit(SubmittablePublicMediumForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(mediumHeight: 0);
          emit(MediumHeightPublicMediumFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPublicMediumThumbnailWidth>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(thumbnailWidth: int.parse(event.value!));
          emit(SubmittablePublicMediumForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(thumbnailWidth: 0);
          emit(ThumbnailWidthPublicMediumFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPublicMediumThumbnailHeight>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(thumbnailHeight: int.parse(event.value!));
          emit(SubmittablePublicMediumForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(thumbnailHeight: 0);
          emit(ThumbnailHeightPublicMediumFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPublicMediumRelatedMediumId>((event, emit) async {
      if (state is PublicMediumFormInitialized) {
        final currentState = state as PublicMediumFormInitialized;
        newValue = currentState.value!.copyWith(relatedMediumId: event.value);
        emit(SubmittablePublicMediumForm(value: newValue));
      }
    });
  }

  DocumentIDPublicMediumFormError error(
          String message, PublicMediumModel newValue) =>
      DocumentIDPublicMediumFormError(message: message, value: newValue);

  Future<PublicMediumFormState> _isDocumentIDValid(
      String? value, PublicMediumModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<PublicMediumModel?> findDocument =
        publicMediumRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePublicMediumForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
