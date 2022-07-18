/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_form_bloc.dart
                       
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

import 'package:eliud_core/model/menu_item_form_event.dart';
import 'package:eliud_core/model/menu_item_form_state.dart';
import 'package:eliud_core/model/menu_item_repository.dart';

class MenuItemFormBloc extends Bloc<MenuItemFormEvent, MenuItemFormState> {
  final String? appId;

  MenuItemFormBloc(this.appId, ): super(MenuItemFormUninitialized()) {
      on <InitialiseNewMenuItemFormEvent> ((event, emit) {
        MenuItemFormLoaded loaded = MenuItemFormLoaded(value: MenuItemModel(
                                               documentID: "IDENTIFIER", 
                                 text: "",
                                 description: "",

        ));
        emit(loaded);
      });


      on <InitialiseMenuItemFormEvent> ((event, emit) async {
        MenuItemFormLoaded loaded = MenuItemFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseMenuItemFormNoLoadEvent> ((event, emit) async {
        MenuItemFormLoaded loaded = MenuItemFormLoaded(value: event.value);
        emit(loaded);
      });
      MenuItemModel? newValue = null;
      on <ChangedMenuItemText> ((event, emit) async {
      if (state is MenuItemFormInitialized) {
        final currentState = state as MenuItemFormInitialized;
        newValue = currentState.value!.copyWith(text: event.value);
        emit(SubmittableMenuItemForm(value: newValue));

      }
      });
      on <ChangedMenuItemDescription> ((event, emit) async {
      if (state is MenuItemFormInitialized) {
        final currentState = state as MenuItemFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableMenuItemForm(value: newValue));

      }
      });
      on <ChangedMenuItemIcon> ((event, emit) async {
      if (state is MenuItemFormInitialized) {
        final currentState = state as MenuItemFormInitialized;
        newValue = currentState.value!.copyWith(icon: event.value);
        emit(SubmittableMenuItemForm(value: newValue));

      }
      });
      on <ChangedMenuItemAction> ((event, emit) async {
      if (state is MenuItemFormInitialized) {
        final currentState = state as MenuItemFormInitialized;
        newValue = currentState.value!.copyWith(action: event.value);
        emit(SubmittableMenuItemForm(value: newValue));

      }
      });
  }


}

