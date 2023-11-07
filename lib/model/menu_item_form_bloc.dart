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

import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/menu_item_form_event.dart';
import 'package:eliud_core/model/menu_item_form_state.dart';

class MenuItemFormBloc extends Bloc<MenuItemFormEvent, MenuItemFormState> {
  final String? appId;

  MenuItemFormBloc(
    this.appId,
  ) : super(MenuItemFormUninitialized()) {
    on<InitialiseNewMenuItemFormEvent>((event, emit) {
      MenuItemFormLoaded loaded = MenuItemFormLoaded(
          value: MenuItemModel(
        documentID: "IDENTIFIER",
        text: "",
        description: "",
      ));
      emit(loaded);
    });

    on<InitialiseMenuItemFormEvent>((event, emit) async {
      MenuItemFormLoaded loaded = MenuItemFormLoaded(value: event.value);
      emit(loaded);
    });
    on<InitialiseMenuItemFormNoLoadEvent>((event, emit) async {
      MenuItemFormLoaded loaded = MenuItemFormLoaded(value: event.value);
      emit(loaded);
    });
    MenuItemModel? newValue;
    on<ChangedMenuItemText>((event, emit) async {
      if (state is MenuItemFormInitialized) {
        final currentState = state as MenuItemFormInitialized;
        newValue = currentState.value!.copyWith(text: event.value);
        emit(SubmittableMenuItemForm(value: newValue));
      }
    });
    on<ChangedMenuItemDescription>((event, emit) async {
      if (state is MenuItemFormInitialized) {
        final currentState = state as MenuItemFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableMenuItemForm(value: newValue));
      }
    });
    on<ChangedMenuItemIcon>((event, emit) async {
      if (state is MenuItemFormInitialized) {
        final currentState = state as MenuItemFormInitialized;
        newValue = currentState.value!.copyWith(icon: event.value);
        emit(SubmittableMenuItemForm(value: newValue));
      }
    });
    on<ChangedMenuItemAction>((event, emit) async {
      if (state is MenuItemFormInitialized) {
        final currentState = state as MenuItemFormInitialized;
        newValue = currentState.value!.copyWith(action: event.value);
        emit(SubmittableMenuItemForm(value: newValue));
      }
    });
  }
}
