/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'app_entry_pages_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppEntryPagesFormState extends Equatable {
  const AppEntryPagesFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AppEntryPagesFormUninitialized extends AppEntryPagesFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''AppEntryPagesFormState()''';
  }
}

// AppEntryPagesModel has been initialised and hence AppEntryPagesModel is available
class AppEntryPagesFormInitialized extends AppEntryPagesFormState {
  final AppEntryPagesModel? value;

  @override
  List<Object?> get props => [value];

  const AppEntryPagesFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class AppEntryPagesFormError extends AppEntryPagesFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const AppEntryPagesFormError({this.message, super.value});

  @override
  String toString() {
    return '''AppEntryPagesFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDAppEntryPagesFormError extends AppEntryPagesFormError {
  const DocumentIDAppEntryPagesFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDAppEntryPagesFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class EntryPageAppEntryPagesFormError extends AppEntryPagesFormError {
  const EntryPageAppEntryPagesFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''EntryPageAppEntryPagesFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MinPrivilegeAppEntryPagesFormError extends AppEntryPagesFormError {
  const MinPrivilegeAppEntryPagesFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MinPrivilegeAppEntryPagesFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppEntryPagesFormLoaded extends AppEntryPagesFormInitialized {
  const AppEntryPagesFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''AppEntryPagesFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableAppEntryPagesForm extends AppEntryPagesFormInitialized {
  const SubmittableAppEntryPagesForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableAppEntryPagesForm {
      value: $value,
    }''';
  }
}
