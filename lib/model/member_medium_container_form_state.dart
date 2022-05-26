/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'member_medium_container_model.dart';

@immutable
abstract class MemberMediumContainerFormState extends Equatable {
  const MemberMediumContainerFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberMediumContainerFormUninitialized extends MemberMediumContainerFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MemberMediumContainerFormState()''';
  }
}

// MemberMediumContainerModel has been initialised and hence MemberMediumContainerModel is available
class MemberMediumContainerFormInitialized extends MemberMediumContainerFormState {
  final MemberMediumContainerModel? value;

  @override
  List<Object?> get props => [ value ];

  const MemberMediumContainerFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class MemberMediumContainerFormError extends MemberMediumContainerFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const MemberMediumContainerFormError({this.message, MemberMediumContainerModel? value }) : super(value: value);

  @override
  String toString() {
    return '''MemberMediumContainerFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDMemberMediumContainerFormError extends MemberMediumContainerFormError { 
  const DocumentIDMemberMediumContainerFormError({ String? message, MemberMediumContainerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDMemberMediumContainerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MemberMediumMemberMediumContainerFormError extends MemberMediumContainerFormError { 
  const MemberMediumMemberMediumContainerFormError({ String? message, MemberMediumContainerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MemberMediumMemberMediumContainerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MemberMediumContainerFormLoaded extends MemberMediumContainerFormInitialized { 
  const MemberMediumContainerFormLoaded({ MemberMediumContainerModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''MemberMediumContainerFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableMemberMediumContainerForm extends MemberMediumContainerFormInitialized { 
  const SubmittableMemberMediumContainerForm({ MemberMediumContainerModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableMemberMediumContainerForm {
      value: $value,
    }''';
  }
}


