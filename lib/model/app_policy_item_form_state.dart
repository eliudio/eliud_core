/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'app_policy_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppPolicyItemFormState extends Equatable {
  const AppPolicyItemFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AppPolicyItemFormUninitialized extends AppPolicyItemFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''AppPolicyItemFormState()''';
  }
}

// AppPolicyItemModel has been initialised and hence AppPolicyItemModel is available
class AppPolicyItemFormInitialized extends AppPolicyItemFormState {
  final AppPolicyItemModel? value;

  @override
  List<Object?> get props => [ value ];

  const AppPolicyItemFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class AppPolicyItemFormError extends AppPolicyItemFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const AppPolicyItemFormError({this.message, AppPolicyItemModel? value }) : super(value: value);

  @override
  String toString() {
    return '''AppPolicyItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDAppPolicyItemFormError extends AppPolicyItemFormError { 
  const DocumentIDAppPolicyItemFormError({ String? message, AppPolicyItemModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDAppPolicyItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NameAppPolicyItemFormError extends AppPolicyItemFormError { 
  const NameAppPolicyItemFormError({ String? message, AppPolicyItemModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''NameAppPolicyItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PolicyAppPolicyItemFormError extends AppPolicyItemFormError { 
  const PolicyAppPolicyItemFormError({ String? message, AppPolicyItemModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''PolicyAppPolicyItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppPolicyItemFormLoaded extends AppPolicyItemFormInitialized { 
  const AppPolicyItemFormLoaded({ AppPolicyItemModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''AppPolicyItemFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableAppPolicyItemForm extends AppPolicyItemFormInitialized { 
  const SubmittableAppPolicyItemForm({ AppPolicyItemModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableAppPolicyItemForm {
      value: $value,
    }''';
  }
}


