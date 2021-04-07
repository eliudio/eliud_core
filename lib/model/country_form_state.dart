/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'country_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CountryFormState extends Equatable {
  const CountryFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class CountryFormUninitialized extends CountryFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''CountryFormState()''';
  }
}

// CountryModel has been initialised and hence CountryModel is available
class CountryFormInitialized extends CountryFormState {
  final CountryModel? value;

  @override
  List<Object?> get props => [ value ];

  const CountryFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class CountryFormError extends CountryFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const CountryFormError({this.message, CountryModel? value }) : super(value: value);

  @override
  String toString() {
    return '''CountryFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDCountryFormError extends CountryFormError { 
  const DocumentIDCountryFormError({ String? message, CountryModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDCountryFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CountryCodeCountryFormError extends CountryFormError { 
  const CountryCodeCountryFormError({ String? message, CountryModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''CountryCodeCountryFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CountryNameCountryFormError extends CountryFormError { 
  const CountryNameCountryFormError({ String? message, CountryModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''CountryNameCountryFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CountryFormLoaded extends CountryFormInitialized { 
  const CountryFormLoaded({ CountryModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''CountryFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableCountryForm extends CountryFormInitialized { 
  const SubmittableCountryForm({ CountryModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableCountryForm {
      value: $value,
    }''';
  }
}


