/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'home_menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeMenuFormState extends Equatable {
  const HomeMenuFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class HomeMenuFormUninitialized extends HomeMenuFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''HomeMenuFormState()''';
  }
}

// HomeMenuModel has been initialised and hence HomeMenuModel is available
class HomeMenuFormInitialized extends HomeMenuFormState {
  final HomeMenuModel? value;

  @override
  List<Object?> get props => [value];

  const HomeMenuFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class HomeMenuFormError extends HomeMenuFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const HomeMenuFormError({this.message, super.value});

  @override
  String toString() {
    return '''HomeMenuFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDHomeMenuFormError extends HomeMenuFormError {
  const DocumentIDHomeMenuFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDHomeMenuFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdHomeMenuFormError extends HomeMenuFormError {
  const AppIdHomeMenuFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdHomeMenuFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameHomeMenuFormError extends HomeMenuFormError {
  const NameHomeMenuFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameHomeMenuFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MenuHomeMenuFormError extends HomeMenuFormError {
  const MenuHomeMenuFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MenuHomeMenuFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class IconColorOverrideHomeMenuFormError extends HomeMenuFormError {
  const IconColorOverrideHomeMenuFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''IconColorOverrideHomeMenuFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BackgroundOverrideHomeMenuFormError extends HomeMenuFormError {
  const BackgroundOverrideHomeMenuFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BackgroundOverrideHomeMenuFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PopupMenuBackgroundColorOverrideHomeMenuFormError
    extends HomeMenuFormError {
  const PopupMenuBackgroundColorOverrideHomeMenuFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PopupMenuBackgroundColorOverrideHomeMenuFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class HomeMenuFormLoaded extends HomeMenuFormInitialized {
  const HomeMenuFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''HomeMenuFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableHomeMenuForm extends HomeMenuFormInitialized {
  const SubmittableHomeMenuForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableHomeMenuForm {
      value: $value,
    }''';
  }
}
