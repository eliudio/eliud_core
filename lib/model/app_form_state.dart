/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'app_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppFormState extends Equatable {
  const AppFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AppFormUninitialized extends AppFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''AppFormState()''';
  }
}

// AppModel has been initialised and hence AppModel is available
class AppFormInitialized extends AppFormState {
  final AppModel? value;

  @override
  List<Object?> get props => [ value ];

  const AppFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class AppFormError extends AppFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const AppFormError({this.message, AppModel? value }) : super(value: value);

  @override
  String toString() {
    return '''AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDAppFormError extends AppFormError { 
  const DocumentIDAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class OwnerIDAppFormError extends AppFormError { 
  const OwnerIDAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''OwnerIDAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleAppFormError extends AppFormError { 
  const TitleAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class EmailAppFormError extends AppFormError { 
  const EmailAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''EmailAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionAppFormError extends AppFormError { 
  const DescriptionAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppStatusAppFormError extends AppFormError { 
  const AppStatusAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppStatusAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HomePagesAppFormError extends AppFormError { 
  const HomePagesAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HomePagesAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class LogoAppFormError extends AppFormError { 
  const LogoAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''LogoAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RouteAnimationDurationAppFormError extends AppFormError { 
  const RouteAnimationDurationAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''RouteAnimationDurationAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PoliciesAppFormError extends AppFormError { 
  const PoliciesAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''PoliciesAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class StyleFamilyAppFormError extends AppFormError { 
  const StyleFamilyAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''StyleFamilyAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class StyleNameAppFormError extends AppFormError { 
  const StyleNameAppFormError({ String? message, AppModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''StyleNameAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppFormLoaded extends AppFormInitialized { 
  const AppFormLoaded({ AppModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''AppFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableAppForm extends AppFormInitialized { 
  const SubmittableAppForm({ AppModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableAppForm {
      value: $value,
    }''';
  }
}


