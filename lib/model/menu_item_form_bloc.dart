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

  MenuItemFormBloc(this.appId, ): super(MenuItemFormUninitialized());
  @override
  Stream<MenuItemFormState> mapEventToState(MenuItemFormEvent event) async* {
    final currentState = state;
    if (currentState is MenuItemFormUninitialized) {
      if (event is InitialiseNewMenuItemFormEvent) {
        MenuItemFormLoaded loaded = MenuItemFormLoaded(value: MenuItemModel(
                                               documentID: "IDENTIFIER", 
                                 text: "",
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseMenuItemFormEvent) {
        MenuItemFormLoaded loaded = MenuItemFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseMenuItemFormNoLoadEvent) {
        MenuItemFormLoaded loaded = MenuItemFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is MenuItemFormInitialized) {
      MenuItemModel? newValue = null;
      if (event is ChangedMenuItemText) {
        newValue = currentState.value!.copyWith(text: event.value);
        yield SubmittableMenuItemForm(value: newValue);

        return;
      }
      if (event is ChangedMenuItemDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableMenuItemForm(value: newValue);

        return;
      }
      if (event is ChangedMenuItemIcon) {
        newValue = currentState.value!.copyWith(icon: event.value);
        yield SubmittableMenuItemForm(value: newValue);

        return;
      }
      if (event is ChangedMenuItemAction) {
        newValue = currentState.value!.copyWith(action: event.value);
        yield SubmittableMenuItemForm(value: newValue);

        return;
      }
    }
  }


}

