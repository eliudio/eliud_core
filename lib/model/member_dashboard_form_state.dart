/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_dashboard_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberDashboardFormState extends Equatable {
  const MemberDashboardFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberDashboardFormUninitialized extends MemberDashboardFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MemberDashboardFormState()''';
  }
}

// MemberDashboardModel has been initialised and hence MemberDashboardModel is available
class MemberDashboardFormInitialized extends MemberDashboardFormState {
  final MemberDashboardModel? value;

  @override
  List<Object?> get props => [ value ];

  const MemberDashboardFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class MemberDashboardFormError extends MemberDashboardFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const MemberDashboardFormError({this.message, MemberDashboardModel? value }) : super(value: value);

  @override
  String toString() {
    return '''MemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDMemberDashboardFormError extends MemberDashboardFormError { 
  const DocumentIDMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdMemberDashboardFormError extends MemberDashboardFormError { 
  const AppIdMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionMemberDashboardFormError extends MemberDashboardFormError { 
  const DescriptionMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class UpdateProfileTextMemberDashboardFormError extends MemberDashboardFormError { 
  const UpdateProfileTextMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''UpdateProfileTextMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RetrieveDataTextMemberDashboardFormError extends MemberDashboardFormError { 
  const RetrieveDataTextMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''RetrieveDataTextMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DeleteDataTextMemberDashboardFormError extends MemberDashboardFormError { 
  const DeleteDataTextMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DeleteDataTextMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RetrieveDataEmailSubjectMemberDashboardFormError extends MemberDashboardFormError { 
  const RetrieveDataEmailSubjectMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''RetrieveDataEmailSubjectMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DeleteDataEmailSubjectMemberDashboardFormError extends MemberDashboardFormError { 
  const DeleteDataEmailSubjectMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DeleteDataEmailSubjectMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DeleteDataEmailMessageMemberDashboardFormError extends MemberDashboardFormError { 
  const DeleteDataEmailMessageMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DeleteDataEmailMessageMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsMemberDashboardFormError extends MemberDashboardFormError { 
  const ConditionsMemberDashboardFormError({ String? message, MemberDashboardModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsMemberDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MemberDashboardFormLoaded extends MemberDashboardFormInitialized { 
  const MemberDashboardFormLoaded({ MemberDashboardModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''MemberDashboardFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableMemberDashboardForm extends MemberDashboardFormInitialized { 
  const SubmittableMemberDashboardForm({ MemberDashboardModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableMemberDashboardForm {
      value: $value,
    }''';
  }
}


