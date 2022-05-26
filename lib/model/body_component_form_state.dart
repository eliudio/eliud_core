/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'body_component_model.dart';

@immutable
abstract class BodyComponentFormState extends Equatable {
  const BodyComponentFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class BodyComponentFormUninitialized extends BodyComponentFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''BodyComponentFormState()''';
  }
}

// BodyComponentModel has been initialised and hence BodyComponentModel is available
class BodyComponentFormInitialized extends BodyComponentFormState {
  final BodyComponentModel? value;

  @override
  List<Object?> get props => [ value ];

  const BodyComponentFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class BodyComponentFormError extends BodyComponentFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const BodyComponentFormError({this.message, BodyComponentModel? value }) : super(value: value);

  @override
  String toString() {
    return '''BodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDBodyComponentFormError extends BodyComponentFormError { 
  const DocumentIDBodyComponentFormError({ String? message, BodyComponentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDBodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ComponentNameBodyComponentFormError extends BodyComponentFormError { 
  const ComponentNameBodyComponentFormError({ String? message, BodyComponentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ComponentNameBodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ComponentIdBodyComponentFormError extends BodyComponentFormError { 
  const ComponentIdBodyComponentFormError({ String? message, BodyComponentModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ComponentIdBodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BodyComponentFormLoaded extends BodyComponentFormInitialized { 
  const BodyComponentFormLoaded({ BodyComponentModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''BodyComponentFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableBodyComponentForm extends BodyComponentFormInitialized { 
  const SubmittableBodyComponentForm({ BodyComponentModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableBodyComponentForm {
      value: $value,
    }''';
  }
}


