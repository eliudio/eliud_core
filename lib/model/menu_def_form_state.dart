/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'menu_def_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MenuDefFormState extends Equatable {
  const MenuDefFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MenuDefFormUninitialized extends MenuDefFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MenuDefFormState()''';
  }
}

// MenuDefModel has been initialised and hence MenuDefModel is available
class MenuDefFormInitialized extends MenuDefFormState {
  final MenuDefModel? value;

  @override
  List<Object?> get props => [value];

  const MenuDefFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class MenuDefFormError extends MenuDefFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const MenuDefFormError({this.message, super.value});

  @override
  String toString() {
    return '''MenuDefFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDMenuDefFormError extends MenuDefFormError {
  const DocumentIDMenuDefFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDMenuDefFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdMenuDefFormError extends MenuDefFormError {
  const AppIdMenuDefFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdMenuDefFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameMenuDefFormError extends MenuDefFormError {
  const NameMenuDefFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameMenuDefFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MenuItemsMenuDefFormError extends MenuDefFormError {
  const MenuItemsMenuDefFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MenuItemsMenuDefFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AdminMenuDefFormError extends MenuDefFormError {
  const AdminMenuDefFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AdminMenuDefFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MenuDefFormLoaded extends MenuDefFormInitialized {
  const MenuDefFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''MenuDefFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableMenuDefForm extends MenuDefFormInitialized {
  const SubmittableMenuDefForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableMenuDefForm {
      value: $value,
    }''';
  }
}
