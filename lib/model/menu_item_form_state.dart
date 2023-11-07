/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'menu_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MenuItemFormState extends Equatable {
  const MenuItemFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MenuItemFormUninitialized extends MenuItemFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MenuItemFormState()''';
  }
}

// MenuItemModel has been initialised and hence MenuItemModel is available
class MenuItemFormInitialized extends MenuItemFormState {
  final MenuItemModel? value;

  @override
  List<Object?> get props => [value];

  const MenuItemFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class MenuItemFormError extends MenuItemFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const MenuItemFormError({this.message, super.value});

  @override
  String toString() {
    return '''MenuItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDMenuItemFormError extends MenuItemFormError {
  const DocumentIDMenuItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDMenuItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TextMenuItemFormError extends MenuItemFormError {
  const TextMenuItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TextMenuItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionMenuItemFormError extends MenuItemFormError {
  const DescriptionMenuItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionMenuItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class IconMenuItemFormError extends MenuItemFormError {
  const IconMenuItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''IconMenuItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ActionMenuItemFormError extends MenuItemFormError {
  const ActionMenuItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ActionMenuItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MenuItemFormLoaded extends MenuItemFormInitialized {
  const MenuItemFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''MenuItemFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableMenuItemForm extends MenuItemFormInitialized {
  const SubmittableMenuItemForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableMenuItemForm {
      value: $value,
    }''';
  }
}
