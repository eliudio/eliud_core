/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'policy_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PolicyFormState extends Equatable {
  const PolicyFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PolicyFormUninitialized extends PolicyFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''PolicyFormState()''';
  }
}

// PolicyModel has been initialised and hence PolicyModel is available
class PolicyFormInitialized extends PolicyFormState {
  final PolicyModel value;

  @override
  List<Object> get props => [ value ];

  const PolicyFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class PolicyFormError extends PolicyFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const PolicyFormError({this.message, PolicyModel value }) : super(value: value);

  @override
  String toString() {
    return '''PolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDPolicyFormError extends PolicyFormError { 
  const DocumentIDPolicyFormError({ String message, PolicyModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDPolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdPolicyFormError extends PolicyFormError { 
  const AppIdPolicyFormError({ String message, PolicyModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdPolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NamePolicyFormError extends PolicyFormError { 
  const NamePolicyFormError({ String message, PolicyModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''NamePolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlPolicyFormError extends PolicyFormError { 
  const HtmlPolicyFormError({ String message, PolicyModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''HtmlPolicyFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PolicyFormLoaded extends PolicyFormInitialized { 
  const PolicyFormLoaded({ PolicyModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''PolicyFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittablePolicyForm extends PolicyFormInitialized { 
  const SubmittablePolicyForm({ PolicyModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittablePolicyForm {
      value: $value,
    }''';
  }
}


