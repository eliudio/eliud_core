/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'background_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BackgroundFormState extends Equatable {
  const BackgroundFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class BackgroundFormUninitialized extends BackgroundFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''BackgroundFormState()''';
  }
}

// BackgroundModel has been initialised and hence BackgroundModel is available
class BackgroundFormInitialized extends BackgroundFormState {
  final BackgroundModel? value;

  @override
  List<Object?> get props => [ value ];

  const BackgroundFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class BackgroundFormError extends BackgroundFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const BackgroundFormError({this.message, BackgroundModel? value }) : super(value: value);

  @override
  String toString() {
    return '''BackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDBackgroundFormError extends BackgroundFormError { 
  const DocumentIDBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CommentsBackgroundFormError extends BackgroundFormError { 
  const CommentsBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''CommentsBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BackgroundImageURLBackgroundFormError extends BackgroundFormError { 
  const BackgroundImageURLBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BackgroundImageURLBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class UseProfilePhotoAsBackgroundBackgroundFormError extends BackgroundFormError { 
  const UseProfilePhotoAsBackgroundBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''UseProfilePhotoAsBackgroundBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BeginGradientPositionBackgroundFormError extends BackgroundFormError { 
  const BeginGradientPositionBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BeginGradientPositionBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class EndGradientPositionBackgroundFormError extends BackgroundFormError { 
  const EndGradientPositionBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''EndGradientPositionBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ShadowBackgroundFormError extends BackgroundFormError { 
  const ShadowBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ShadowBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DecorationColorsBackgroundFormError extends BackgroundFormError { 
  const DecorationColorsBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DecorationColorsBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BorderBackgroundFormError extends BackgroundFormError { 
  const BorderBackgroundFormError({ String? message, BackgroundModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BorderBackgroundFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BackgroundFormLoaded extends BackgroundFormInitialized { 
  const BackgroundFormLoaded({ BackgroundModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''BackgroundFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableBackgroundForm extends BackgroundFormInitialized { 
  const SubmittableBackgroundForm({ BackgroundModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableBackgroundForm {
      value: $value,
    }''';
  }
}


