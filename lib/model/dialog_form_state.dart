/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dialog_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DialogFormState extends Equatable {
  const DialogFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DialogFormUninitialized extends DialogFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''DialogFormState()''';
  }
}

// DialogModel has been initialised and hence DialogModel is available
class DialogFormInitialized extends DialogFormState {
  final DialogModel? value;

  @override
  List<Object?> get props => [ value ];

  const DialogFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class DialogFormError extends DialogFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const DialogFormError({this.message, DialogModel? value }) : super(value: value);

  @override
  String toString() {
    return '''DialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDDialogFormError extends DialogFormError { 
  const DocumentIDDialogFormError({ String? message, DialogModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDDialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdDialogFormError extends DialogFormError { 
  const AppIdDialogFormError({ String? message, DialogModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdDialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleDialogFormError extends DialogFormError { 
  const TitleDialogFormError({ String? message, DialogModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleDialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BodyComponentsDialogFormError extends DialogFormError { 
  const BodyComponentsDialogFormError({ String? message, DialogModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BodyComponentsDialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BackgroundDialogFormError extends DialogFormError { 
  const BackgroundDialogFormError({ String? message, DialogModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BackgroundDialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class LayoutDialogFormError extends DialogFormError { 
  const LayoutDialogFormError({ String? message, DialogModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''LayoutDialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class GridViewDialogFormError extends DialogFormError { 
  const GridViewDialogFormError({ String? message, DialogModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''GridViewDialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsDialogFormError extends DialogFormError { 
  const ConditionsDialogFormError({ String? message, DialogModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsDialogFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DialogFormLoaded extends DialogFormInitialized { 
  const DialogFormLoaded({ DialogModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''DialogFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableDialogForm extends DialogFormInitialized { 
  const SubmittableDialogForm({ DialogModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableDialogForm {
      value: $value,
    }''';
  }
}


