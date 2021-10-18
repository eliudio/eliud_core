/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'public_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PublicMediumFormState extends Equatable {
  const PublicMediumFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PublicMediumFormUninitialized extends PublicMediumFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PublicMediumFormState()''';
  }
}

// PublicMediumModel has been initialised and hence PublicMediumModel is available
class PublicMediumFormInitialized extends PublicMediumFormState {
  final PublicMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  const PublicMediumFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class PublicMediumFormError extends PublicMediumFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const PublicMediumFormError({this.message, PublicMediumModel? value }) : super(value: value);

  @override
  String toString() {
    return '''PublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDPublicMediumFormError extends PublicMediumFormError { 
  const DocumentIDPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AuthorIdPublicMediumFormError extends PublicMediumFormError { 
  const AuthorIdPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AuthorIdPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BaseNamePublicMediumFormError extends PublicMediumFormError { 
  const BaseNamePublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BaseNamePublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class UrlPublicMediumFormError extends PublicMediumFormError { 
  const UrlPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''UrlPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RefPublicMediumFormError extends PublicMediumFormError { 
  const RefPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''RefPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class UrlThumbnailPublicMediumFormError extends PublicMediumFormError { 
  const UrlThumbnailPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''UrlThumbnailPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RefThumbnailPublicMediumFormError extends PublicMediumFormError { 
  const RefThumbnailPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''RefThumbnailPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MediumTypePublicMediumFormError extends PublicMediumFormError { 
  const MediumTypePublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MediumTypePublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MediumWidthPublicMediumFormError extends PublicMediumFormError { 
  const MediumWidthPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MediumWidthPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MediumHeightPublicMediumFormError extends PublicMediumFormError { 
  const MediumHeightPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MediumHeightPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ThumbnailWidthPublicMediumFormError extends PublicMediumFormError { 
  const ThumbnailWidthPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ThumbnailWidthPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ThumbnailHeightPublicMediumFormError extends PublicMediumFormError { 
  const ThumbnailHeightPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ThumbnailHeightPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RelatedMediumIdPublicMediumFormError extends PublicMediumFormError { 
  const RelatedMediumIdPublicMediumFormError({ String? message, PublicMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''RelatedMediumIdPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PublicMediumFormLoaded extends PublicMediumFormInitialized { 
  const PublicMediumFormLoaded({ PublicMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''PublicMediumFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittablePublicMediumForm extends PublicMediumFormInitialized { 
  const SubmittablePublicMediumForm({ PublicMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittablePublicMediumForm {
      value: $value,
    }''';
  }
}


