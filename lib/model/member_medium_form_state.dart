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
  List<Object?> get props => [ value ];

  const MemberMediumFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class MemberMediumFormError extends MemberMediumFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const MemberMediumFormError({this.message, MemberMediumModel? value }) : super(value: value);

  @override
  String toString() {
    return '''MemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDMemberMediumFormError extends MemberMediumFormError { 
  const DocumentIDMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdMemberMediumFormError extends MemberMediumFormError { 
  const AppIdMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AuthorIdMemberMediumFormError extends MemberMediumFormError { 
  const AuthorIdMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AuthorIdMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class UrlMemberMediumFormError extends MemberMediumFormError { 
  const UrlMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''UrlMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RefMemberMediumFormError extends MemberMediumFormError { 
  const RefMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''RefMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class UrlThumbnailMemberMediumFormError extends MemberMediumFormError { 
  const UrlThumbnailMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''UrlThumbnailMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ReadAccessMemberMediumFormError extends MemberMediumFormError { 
  const ReadAccessMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ReadAccessMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MediumTypeMemberMediumFormError extends MemberMediumFormError { 
  const MediumTypeMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MediumTypeMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MediumWidthMemberMediumFormError extends MemberMediumFormError { 
  const MediumWidthMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MediumWidthMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MediumHeightMemberMediumFormError extends MemberMediumFormError { 
  const MediumHeightMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MediumHeightMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ThumbnailWidthMemberMediumFormError extends MemberMediumFormError { 
  const ThumbnailWidthMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ThumbnailWidthMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ThumbnailHeightMemberMediumFormError extends MemberMediumFormError { 
  const ThumbnailHeightMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ThumbnailHeightMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RelatedMediumIdMemberMediumFormError extends MemberMediumFormError { 
  const RelatedMediumIdMemberMediumFormError({ String? message, MemberMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''RelatedMediumIdMemberMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MemberMediumFormLoaded extends MemberMediumFormInitialized { 
  const MemberMediumFormLoaded({ MemberMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''MemberMediumFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableMemberMediumForm extends MemberMediumFormInitialized { 
  const SubmittableMemberMediumForm({ MemberMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableMemberMediumForm {
      value: $value,
    }''';
  }
}


