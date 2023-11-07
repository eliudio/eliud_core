/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_public_info_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberPublicInfoFormState extends Equatable {
  const MemberPublicInfoFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberPublicInfoFormUninitialized extends MemberPublicInfoFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MemberPublicInfoFormState()''';
  }
}

// MemberPublicInfoModel has been initialised and hence MemberPublicInfoModel is available
class MemberPublicInfoFormInitialized extends MemberPublicInfoFormState {
  final MemberPublicInfoModel? value;

  @override
  List<Object?> get props => [value];

  const MemberPublicInfoFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class MemberPublicInfoFormError
    extends MemberPublicInfoFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const MemberPublicInfoFormError({this.message, super.value});

  @override
  String toString() {
    return '''MemberPublicInfoFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDMemberPublicInfoFormError extends MemberPublicInfoFormError {
  const DocumentIDMemberPublicInfoFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDMemberPublicInfoFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameMemberPublicInfoFormError extends MemberPublicInfoFormError {
  const NameMemberPublicInfoFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameMemberPublicInfoFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PhotoURLMemberPublicInfoFormError extends MemberPublicInfoFormError {
  const PhotoURLMemberPublicInfoFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PhotoURLMemberPublicInfoFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SubscriptionsMemberPublicInfoFormError extends MemberPublicInfoFormError {
  const SubscriptionsMemberPublicInfoFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SubscriptionsMemberPublicInfoFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberPublicInfoFormLoaded extends MemberPublicInfoFormInitialized {
  const MemberPublicInfoFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''MemberPublicInfoFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableMemberPublicInfoForm extends MemberPublicInfoFormInitialized {
  const SubmittableMemberPublicInfoForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableMemberPublicInfoForm {
      value: $value,
    }''';
  }
}
