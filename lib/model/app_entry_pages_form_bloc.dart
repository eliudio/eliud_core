/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_form_bloc.dart
                       
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

import 'package:eliud_core/model/app_entry_pages_form_event.dart';
import 'package:eliud_core/model/app_entry_pages_form_state.dart';
import 'package:eliud_core/model/app_entry_pages_repository.dart';

class AppEntryPagesFormBloc extends Bloc<AppEntryPagesFormEvent, AppEntryPagesFormState> {
  final String appId;

  AppEntryPagesFormBloc(this.appId, ): super(AppEntryPagesFormUninitialized());
  @override
  Stream<AppEntryPagesFormState> mapEventToState(AppEntryPagesFormEvent event) async* {
    final currentState = state;
    if (currentState is AppEntryPagesFormUninitialized) {
      if (event is InitialiseNewAppEntryPagesFormEvent) {
        AppEntryPagesFormLoaded loaded = AppEntryPagesFormLoaded(value: AppEntryPagesModel(
                                               documentID: "IDENTIFIER", 
                                 minPrivilege: 0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseAppEntryPagesFormEvent) {
        AppEntryPagesFormLoaded loaded = AppEntryPagesFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseAppEntryPagesFormNoLoadEvent) {
        AppEntryPagesFormLoaded loaded = AppEntryPagesFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is AppEntryPagesFormInitialized) {
      AppEntryPagesModel newValue = null;
      if (event is ChangedAppEntryPagesEntryPage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(entryPage: await pageRepository(appId: appId).get(event.value));
        else
          newValue = new AppEntryPagesModel(
                                 documentID: currentState.value.documentID,
                                 entryPage: null,
                                 minPrivilege: currentState.value.minPrivilege,
          );
        yield SubmittableAppEntryPagesForm(value: newValue);

        return;
      }
      if (event is ChangedAppEntryPagesMinPrivilege) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(minPrivilege: int.parse(event.value));
          yield SubmittableAppEntryPagesForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(minPrivilege: 0);
          yield MinPrivilegeAppEntryPagesFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
    }
  }


}

