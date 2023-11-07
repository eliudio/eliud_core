/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_subscription_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberSubscriptionFormState extends Equatable {
  const MemberSubscriptionFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberSubscriptionFormUninitialized extends MemberSubscriptionFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MemberSubscriptionFormState()''';
  }
}

// MemberSubscriptionModel has been initialised and hence MemberSubscriptionModel is available
class MemberSubscriptionFormInitialized extends MemberSubscriptionFormState {
  final MemberSubscriptionModel? value;

  @override
  List<Object?> get props => [value];

  const MemberSubscriptionFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class MemberSubscriptionFormError
    extends MemberSubscriptionFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const MemberSubscriptionFormError({this.message, super.value});

  @override
  String toString() {
    return '''MemberSubscriptionFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDMemberSubscriptionFormError
    extends MemberSubscriptionFormError {
  const DocumentIDMemberSubscriptionFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDMemberSubscriptionFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppMemberSubscriptionFormError extends MemberSubscriptionFormError {
  const AppMemberSubscriptionFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppMemberSubscriptionFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberSubscriptionFormLoaded extends MemberSubscriptionFormInitialized {
  const MemberSubscriptionFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''MemberSubscriptionFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableMemberSubscriptionForm
    extends MemberSubscriptionFormInitialized {
  const SubmittableMemberSubscriptionForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableMemberSubscriptionForm {
      value: $value,
    }''';
  }
}
