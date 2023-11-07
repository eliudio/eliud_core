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
  List<Object?> get props => [value];

  const PublicMediumFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PublicMediumFormError extends PublicMediumFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PublicMediumFormError({this.message, super.value});

  @override
  String toString() {
    return '''PublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPublicMediumFormError extends PublicMediumFormError {
  const DocumentIDPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AuthorIdPublicMediumFormError extends PublicMediumFormError {
  const AuthorIdPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AuthorIdPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BasePublicMediumFormError extends PublicMediumFormError {
  const BasePublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BasePublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ExtPublicMediumFormError extends PublicMediumFormError {
  const ExtPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ExtPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class UrlPublicMediumFormError extends PublicMediumFormError {
  const UrlPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''UrlPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RefPublicMediumFormError extends PublicMediumFormError {
  const RefPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RefPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class UrlThumbnailPublicMediumFormError extends PublicMediumFormError {
  const UrlThumbnailPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''UrlThumbnailPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RefThumbnailPublicMediumFormError extends PublicMediumFormError {
  const RefThumbnailPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RefThumbnailPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumTypePublicMediumFormError extends PublicMediumFormError {
  const MediumTypePublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumTypePublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumWidthPublicMediumFormError extends PublicMediumFormError {
  const MediumWidthPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumWidthPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumHeightPublicMediumFormError extends PublicMediumFormError {
  const MediumHeightPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumHeightPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ThumbnailWidthPublicMediumFormError extends PublicMediumFormError {
  const ThumbnailWidthPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ThumbnailWidthPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ThumbnailHeightPublicMediumFormError extends PublicMediumFormError {
  const ThumbnailHeightPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ThumbnailHeightPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RelatedMediumIdPublicMediumFormError extends PublicMediumFormError {
  const RelatedMediumIdPublicMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RelatedMediumIdPublicMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PublicMediumFormLoaded extends PublicMediumFormInitialized {
  const PublicMediumFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PublicMediumFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePublicMediumForm extends PublicMediumFormInitialized {
  const SubmittablePublicMediumForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePublicMediumForm {
      value: $value,
    }''';
  }
}
