/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'app_policy_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppPolicyFormState extends Equatable {
  const AppPolicyFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AppPolicyFormUninitialized extends AppPolicyFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''AppPolicyFormState()''';
  }
}

// AppPolicyModel has been initialised and hence AppPolicyModel is available
class AppPolicyFormInitialized extends AppPolicyFormState {
  final AppPolicyModel? value;

  @override
  List<Object?> get props => [ value ];

  const AppPolicyFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class AppPolicyFormError extends AppPolicyFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const AppPolicyFormError({this.message, AppPolicyModel? value }) : super(value: value);

  @override
  String toString() {
    return '''AppPolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDAppPolicyFormError extends AppPolicyFormError { 
  const DocumentIDAppPolicyFormError({ String? message, AppPolicyModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDAppPolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdAppPolicyFormError extends AppPolicyFormError { 
  const AppIdAppPolicyFormError({ String? message, AppPolicyModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdAppPolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CommentsAppPolicyFormError extends AppPolicyFormError { 
  const CommentsAppPolicyFormError({ String? message, AppPolicyModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''CommentsAppPolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PoliciesAppPolicyFormError extends AppPolicyFormError { 
  const PoliciesAppPolicyFormError({ String? message, AppPolicyModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''PoliciesAppPolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppPolicyFormLoaded extends AppPolicyFormInitialized { 
  const AppPolicyFormLoaded({ AppPolicyModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''AppPolicyFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableAppPolicyForm extends AppPolicyFormInitialized { 
  const SubmittableAppPolicyForm({ AppPolicyModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableAppPolicyForm {
      value: $value,
    }''';
  }
}

