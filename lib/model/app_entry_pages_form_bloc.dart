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


import 'package:bloc/bloc.dart';



import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/app_entry_pages_form_event.dart';
import 'package:eliud_core/model/app_entry_pages_form_state.dart';

class AppEntryPagesFormBloc extends Bloc<AppEntryPagesFormEvent, AppEntryPagesFormState> {
  final String? appId;

  AppEntryPagesFormBloc(this.appId, ): super(AppEntryPagesFormUninitialized()) {
      on <InitialiseNewAppEntryPagesFormEvent> ((event, emit) {
        AppEntryPagesFormLoaded loaded = AppEntryPagesFormLoaded(value: AppEntryPagesModel(
                                               documentID: "IDENTIFIER", 
                                 minPrivilege: 0,

        ));
        emit(loaded);
      });


      on <InitialiseAppEntryPagesFormEvent> ((event, emit) async {
        AppEntryPagesFormLoaded loaded = AppEntryPagesFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseAppEntryPagesFormNoLoadEvent> ((event, emit) async {
        AppEntryPagesFormLoaded loaded = AppEntryPagesFormLoaded(value: event.value);
        emit(loaded);
      });
      AppEntryPagesModel? newValue = null;
      on <ChangedAppEntryPagesEntryPage> ((event, emit) async {
      if (state is AppEntryPagesFormInitialized) {
        final currentState = state as AppEntryPagesFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(entryPage: await pageRepository(appId: appId)!.get(event.value));
        emit(SubmittableAppEntryPagesForm(value: newValue));

      }
      });
      on <ChangedAppEntryPagesMinPrivilege> ((event, emit) async {
      if (state is AppEntryPagesFormInitialized) {
        final currentState = state as AppEntryPagesFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(minPrivilege: int.parse(event.value!));
          emit(SubmittableAppEntryPagesForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(minPrivilege: 0);
          emit(MinPrivilegeAppEntryPagesFormError(message: "Value should be a number", value: newValue));
        }
      }
      });
  }


}

