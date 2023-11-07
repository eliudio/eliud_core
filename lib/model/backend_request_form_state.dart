/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'backend_request_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BackendRequestFormState extends Equatable {
  const BackendRequestFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class BackendRequestFormUninitialized extends BackendRequestFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''BackendRequestFormState()''';
  }
}

// BackendRequestModel has been initialised and hence BackendRequestModel is available
class BackendRequestFormInitialized extends BackendRequestFormState {
  final BackendRequestModel? value;

  @override
  List<Object?> get props => [value];

  const BackendRequestFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class BackendRequestFormError extends BackendRequestFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const BackendRequestFormError({this.message, super.value});

  @override
  String toString() {
    return '''BackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDBackendRequestFormError extends BackendRequestFormError {
  const DocumentIDBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionBackendRequestFormError extends BackendRequestFormError {
  const DescriptionBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdBackendRequestFormError extends BackendRequestFormError {
  const AppIdBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AuthorIdBackendRequestFormError extends BackendRequestFormError {
  const AuthorIdBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AuthorIdBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameBackendRequestFormError extends BackendRequestFormError {
  const NameBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SendToBackendRequestFormError extends BackendRequestFormError {
  const SendToBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SendToBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CollectionsBackendRequestFormError extends BackendRequestFormError {
  const CollectionsBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CollectionsBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProcessedBackendRequestFormError extends BackendRequestFormError {
  const ProcessedBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ProcessedBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RequestTypeBackendRequestFormError extends BackendRequestFormError {
  const RequestTypeBackendRequestFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RequestTypeBackendRequestFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BackendRequestFormLoaded extends BackendRequestFormInitialized {
  const BackendRequestFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''BackendRequestFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableBackendRequestForm extends BackendRequestFormInitialized {
  const SubmittableBackendRequestForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableBackendRequestForm {
      value: $value,
    }''';
  }
}
