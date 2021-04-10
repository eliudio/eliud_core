/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'shadow_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShadowFormState extends Equatable {
  const ShadowFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ShadowFormUninitialized extends ShadowFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''ShadowFormState()''';
  }
}

// ShadowModel has been initialised and hence ShadowModel is available
class ShadowFormInitialized extends ShadowFormState {
  final ShadowModel? value;

  @override
  List<Object?> get props => [ value ];

  const ShadowFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class ShadowFormError extends ShadowFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const ShadowFormError({this.message, ShadowModel? value }) : super(value: value);

  @override
  String toString() {
    return '''ShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDShadowFormError extends ShadowFormError { 
  const DocumentIDShadowFormError({ String? message, ShadowModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdShadowFormError extends ShadowFormError { 
  const AppIdShadowFormError({ String? message, ShadowModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CommentsShadowFormError extends ShadowFormError { 
  const CommentsShadowFormError({ String? message, ShadowModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''CommentsShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ColorShadowFormError extends ShadowFormError { 
  const ColorShadowFormError({ String? message, ShadowModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ColorShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class OffsetDXShadowFormError extends ShadowFormError { 
  const OffsetDXShadowFormError({ String? message, ShadowModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''OffsetDXShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class OffsetDYShadowFormError extends ShadowFormError { 
  const OffsetDYShadowFormError({ String? message, ShadowModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''OffsetDYShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class SpreadRadiusShadowFormError extends ShadowFormError { 
  const SpreadRadiusShadowFormError({ String? message, ShadowModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''SpreadRadiusShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BlurRadiusShadowFormError extends ShadowFormError { 
  const BlurRadiusShadowFormError({ String? message, ShadowModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BlurRadiusShadowFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ShadowFormLoaded extends ShadowFormInitialized { 
  const ShadowFormLoaded({ ShadowModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''ShadowFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableShadowForm extends ShadowFormInitialized { 
  const SubmittableShadowForm({ ShadowModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableShadowForm {
      value: $value,
    }''';
  }
}


