/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_bar_form_event.dart';
import 'package:eliud_core/model/app_bar_form_state.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/tools/enums.dart';

class AppBarFormBloc extends Bloc<AppBarFormEvent, AppBarFormState> {
  final FormAction? formAction;
  final String? appId;

  AppBarFormBloc(this.appId, { this.formAction }): super(AppBarFormUninitialized());
  @override
  Stream<AppBarFormState> mapEventToState(AppBarFormEvent event) async* {
    final currentState = state;
    if (currentState is AppBarFormUninitialized) {
      on <InitialiseNewAppBarFormEvent> ((event, emit) {
        AppBarFormLoaded loaded = AppBarFormLoaded(value: AppBarModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 iconColorOverride: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 selectedIconColorOverride: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 menuBackgroundColorOverride: RgbModel(r: 64, g: 6, b: 64, opacity: 1.00), 

        ));
        emit(loaded);
      });


      if (event is InitialiseAppBarFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AppBarFormLoaded loaded = AppBarFormLoaded(value: await appBarRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseAppBarFormNoLoadEvent) {
        AppBarFormLoaded loaded = AppBarFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is AppBarFormInitialized) {
      AppBarModel? newValue = null;
      on <ChangedAppBarDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableAppBarForm(value: newValue));
        }

      });
      on <ChangedAppBarTitle> ((event, emit) async {
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableAppBarForm(value: newValue));

      });
      on <ChangedAppBarHeader> ((event, emit) async {
        newValue = currentState.value!.copyWith(header: event.value);
        emit(SubmittableAppBarForm(value: newValue));

      });
      on <ChangedAppBarIcon> ((event, emit) async {
        newValue = currentState.value!.copyWith(icon: event.value);
        emit(SubmittableAppBarForm(value: newValue));

      });
      on <ChangedAppBarImage> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await memberMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableAppBarForm(value: newValue));

      });
      on <ChangedAppBarIconMenu> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(iconMenu: await menuDefRepository(appId: appId)!.get(event.value));
        emit(SubmittableAppBarForm(value: newValue));

      });
      on <ChangedAppBarBackgroundOverride> ((event, emit) async {
        newValue = currentState.value!.copyWith(backgroundOverride: event.value);
        emit(SubmittableAppBarForm(value: newValue));

      });
      on <ChangedAppBarIconColorOverride> ((event, emit) async {
        newValue = currentState.value!.copyWith(iconColorOverride: event.value);
        emit(SubmittableAppBarForm(value: newValue));

      });
      on <ChangedAppBarSelectedIconColorOverride> ((event, emit) async {
        newValue = currentState.value!.copyWith(selectedIconColorOverride: event.value);
        emit(SubmittableAppBarForm(value: newValue));

      });
      on <ChangedAppBarMenuBackgroundColorOverride> ((event, emit) async {
        newValue = currentState.value!.copyWith(menuBackgroundColorOverride: event.value);
        emit(SubmittableAppBarForm(value: newValue));

      });
    }
  }


  DocumentIDAppBarFormError error(String message, AppBarModel newValue) => DocumentIDAppBarFormError(message: message, value: newValue);

  Future<AppBarFormState> _isDocumentIDValid(String? value, AppBarModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<AppBarModel?> findDocument = appBarRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAppBarForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

