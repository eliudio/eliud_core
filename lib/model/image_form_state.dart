/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'image_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ImageFormState extends Equatable {
  const ImageFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ImageFormUninitialized extends ImageFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''ImageFormState()''';
  }
}

// ImageModel has been initialised and hence ImageModel is available
class ImageFormInitialized extends ImageFormState {
  final ImageModel value;

  @override
  List<Object> get props => [ value ];

  const ImageFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class ImageFormError extends ImageFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const ImageFormError({this.message, ImageModel value }) : super(value: value);

  @override
  String toString() {
    return '''ImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDImageFormError extends ImageFormError { 
  const DocumentIDImageFormError({ String message, ImageModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdImageFormError extends ImageFormError { 
  const AppIdImageFormError({ String message, ImageModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NameImageFormError extends ImageFormError { 
  const NameImageFormError({ String message, ImageModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''NameImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class SourceImageFormError extends ImageFormError { 
  const SourceImageFormError({ String message, ImageModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''SourceImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImageURLOriginalImageFormError extends ImageFormError { 
  const ImageURLOriginalImageFormError({ String message, ImageModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ImageURLOriginalImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImageURLThumbnailImageFormError extends ImageFormError { 
  const ImageURLThumbnailImageFormError({ String message, ImageModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ImageURLThumbnailImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ImageFormLoaded extends ImageFormInitialized { 
  const ImageFormLoaded({ ImageModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''ImageFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableImageForm extends ImageFormInitialized { 
  const SubmittableImageForm({ ImageModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableImageForm {
      value: $value,
    }''';
  }
}


