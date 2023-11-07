/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'platform_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PlatformMediumFormState extends Equatable {
  const PlatformMediumFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PlatformMediumFormUninitialized extends PlatformMediumFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PlatformMediumFormState()''';
  }
}

// PlatformMediumModel has been initialised and hence PlatformMediumModel is available
class PlatformMediumFormInitialized extends PlatformMediumFormState {
  final PlatformMediumModel? value;

  @override
  List<Object?> get props => [value];

  const PlatformMediumFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PlatformMediumFormError extends PlatformMediumFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PlatformMediumFormError({this.message, super.value});

  @override
  String toString() {
    return '''PlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPlatformMediumFormError extends PlatformMediumFormError {
  const DocumentIDPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdPlatformMediumFormError extends PlatformMediumFormError {
  const AppIdPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AuthorIdPlatformMediumFormError extends PlatformMediumFormError {
  const AuthorIdPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AuthorIdPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BasePlatformMediumFormError extends PlatformMediumFormError {
  const BasePlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BasePlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ExtPlatformMediumFormError extends PlatformMediumFormError {
  const ExtPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ExtPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class UrlPlatformMediumFormError extends PlatformMediumFormError {
  const UrlPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''UrlPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RefPlatformMediumFormError extends PlatformMediumFormError {
  const RefPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RefPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class UrlThumbnailPlatformMediumFormError extends PlatformMediumFormError {
  const UrlThumbnailPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''UrlThumbnailPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RefThumbnailPlatformMediumFormError extends PlatformMediumFormError {
  const RefThumbnailPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RefThumbnailPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsPlatformMediumFormError extends PlatformMediumFormError {
  const ConditionsPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumTypePlatformMediumFormError extends PlatformMediumFormError {
  const MediumTypePlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumTypePlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumWidthPlatformMediumFormError extends PlatformMediumFormError {
  const MediumWidthPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumWidthPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumHeightPlatformMediumFormError extends PlatformMediumFormError {
  const MediumHeightPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumHeightPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ThumbnailWidthPlatformMediumFormError extends PlatformMediumFormError {
  const ThumbnailWidthPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ThumbnailWidthPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ThumbnailHeightPlatformMediumFormError extends PlatformMediumFormError {
  const ThumbnailHeightPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ThumbnailHeightPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RelatedMediumIdPlatformMediumFormError extends PlatformMediumFormError {
  const RelatedMediumIdPlatformMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RelatedMediumIdPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PlatformMediumFormLoaded extends PlatformMediumFormInitialized {
  const PlatformMediumFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PlatformMediumFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePlatformMediumForm extends PlatformMediumFormInitialized {
  const SubmittablePlatformMediumForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePlatformMediumForm {
      value: $value,
    }''';
  }
}
