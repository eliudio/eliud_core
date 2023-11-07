/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/blocking_form_event.dart';
import 'package:eliud_core/model/blocking_form_state.dart';

class BlockingFormBloc extends Bloc<BlockingFormEvent, BlockingFormState> {
  final FormAction? formAction;
  final String? appId;

  BlockingFormBloc(this.appId, {this.formAction})
      : super(BlockingFormUninitialized()) {
    on<InitialiseNewBlockingFormEvent>((event, emit) {
      BlockingFormLoaded loaded = BlockingFormLoaded(
          value: BlockingModel(
        documentID: "",
        memberBlocking: "",
        memberBeingBlocked: "",
      ));
      emit(loaded);
    });

    on<InitialiseBlockingFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      BlockingFormLoaded loaded = BlockingFormLoaded(
          value: await blockingRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseBlockingFormNoLoadEvent>((event, emit) async {
      BlockingFormLoaded loaded = BlockingFormLoaded(value: event.value);
      emit(loaded);
    });
    BlockingModel? newValue;
    on<ChangedBlockingDocumentID>((event, emit) async {
      if (state is BlockingFormInitialized) {
        final currentState = state as BlockingFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableBlockingForm(value: newValue));
        }
      }
    });
    on<ChangedBlockingMemberBlocking>((event, emit) async {
      if (state is BlockingFormInitialized) {
        final currentState = state as BlockingFormInitialized;
        newValue = currentState.value!.copyWith(memberBlocking: event.value);
        emit(SubmittableBlockingForm(value: newValue));
      }
    });
    on<ChangedBlockingMemberBeingBlocked>((event, emit) async {
      if (state is BlockingFormInitialized) {
        final currentState = state as BlockingFormInitialized;
        newValue =
            currentState.value!.copyWith(memberBeingBlocked: event.value);
        emit(SubmittableBlockingForm(value: newValue));
      }
    });
  }

  DocumentIDBlockingFormError error(String message, BlockingModel newValue) =>
      DocumentIDBlockingFormError(message: message, value: newValue);

  Future<BlockingFormState> _isDocumentIDValid(
      String? value, BlockingModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<BlockingModel?> findDocument =
        blockingRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableBlockingForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
