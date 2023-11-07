/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberMediumFormState extends Equatable {
  const MemberMediumFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberMediumFormUninitialized extends MemberMediumFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MemberMediumFormState()''';
  }
}

// MemberMediumModel has been initialised and hence MemberMediumModel is available
class MemberMediumFormInitialized extends MemberMediumFormState {
  final MemberMediumModel? value;

  @override
  List<Object?> get props => [value];

  const MemberMediumFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class MemberMediumFormError extends MemberMediumFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const MemberMediumFormError({this.message, super.value});

  @override
  String toString() {
    return '''MemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDMemberMediumFormError extends MemberMediumFormError {
  const DocumentIDMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdMemberMediumFormError extends MemberMediumFormError {
  const AppIdMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AuthorIdMemberMediumFormError extends MemberMediumFormError {
  const AuthorIdMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AuthorIdMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BaseMemberMediumFormError extends MemberMediumFormError {
  const BaseMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BaseMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ExtMemberMediumFormError extends MemberMediumFormError {
  const ExtMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ExtMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class UrlMemberMediumFormError extends MemberMediumFormError {
  const UrlMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''UrlMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RefMemberMediumFormError extends MemberMediumFormError {
  const RefMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RefMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class UrlThumbnailMemberMediumFormError extends MemberMediumFormError {
  const UrlThumbnailMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''UrlThumbnailMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RefThumbnailMemberMediumFormError extends MemberMediumFormError {
  const RefThumbnailMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RefThumbnailMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AccessibleByGroupMemberMediumFormError extends MemberMediumFormError {
  const AccessibleByGroupMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AccessibleByGroupMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AccessibleByMembersMemberMediumFormError extends MemberMediumFormError {
  const AccessibleByMembersMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AccessibleByMembersMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ReadAccessMemberMediumFormError extends MemberMediumFormError {
  const ReadAccessMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ReadAccessMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumTypeMemberMediumFormError extends MemberMediumFormError {
  const MediumTypeMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumTypeMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumWidthMemberMediumFormError extends MemberMediumFormError {
  const MediumWidthMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumWidthMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MediumHeightMemberMediumFormError extends MemberMediumFormError {
  const MediumHeightMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MediumHeightMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ThumbnailWidthMemberMediumFormError extends MemberMediumFormError {
  const ThumbnailWidthMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ThumbnailWidthMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ThumbnailHeightMemberMediumFormError extends MemberMediumFormError {
  const ThumbnailHeightMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ThumbnailHeightMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RelatedMediumIdMemberMediumFormError extends MemberMediumFormError {
  const RelatedMediumIdMemberMediumFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RelatedMediumIdMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberMediumFormLoaded extends MemberMediumFormInitialized {
  const MemberMediumFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''MemberMediumFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableMemberMediumForm extends MemberMediumFormInitialized {
  const SubmittableMemberMediumForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableMemberMediumForm {
      value: $value,
    }''';
  }
}
