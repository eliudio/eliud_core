/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'app_bar_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppBarFormState extends Equatable {
  const AppBarFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AppBarFormUninitialized extends AppBarFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''AppBarFormState()''';
  }
}

// AppBarModel has been initialised and hence AppBarModel is available
class AppBarFormInitialized extends AppBarFormState {
  final AppBarModel? value;

  @override
  List<Object?> get props => [value];

  const AppBarFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class AppBarFormError extends AppBarFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const AppBarFormError({this.message, super.value});

  @override
  String toString() {
    return '''AppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDAppBarFormError extends AppBarFormError {
  const DocumentIDAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdAppBarFormError extends AppBarFormError {
  const AppIdAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TitleAppBarFormError extends AppBarFormError {
  const TitleAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TitleAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class HeaderAppBarFormError extends AppBarFormError {
  const HeaderAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''HeaderAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class IconAppBarFormError extends AppBarFormError {
  const IconAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''IconAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImageAppBarFormError extends AppBarFormError {
  const ImageAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImageAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class IconMenuAppBarFormError extends AppBarFormError {
  const IconMenuAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''IconMenuAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BackgroundOverrideAppBarFormError extends AppBarFormError {
  const BackgroundOverrideAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BackgroundOverrideAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class IconColorOverrideAppBarFormError extends AppBarFormError {
  const IconColorOverrideAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''IconColorOverrideAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SelectedIconColorOverrideAppBarFormError extends AppBarFormError {
  const SelectedIconColorOverrideAppBarFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SelectedIconColorOverrideAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MenuBackgroundColorOverrideAppBarFormError extends AppBarFormError {
  const MenuBackgroundColorOverrideAppBarFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MenuBackgroundColorOverrideAppBarFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppBarFormLoaded extends AppBarFormInitialized {
  const AppBarFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''AppBarFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableAppBarForm extends AppBarFormInitialized {
  const SubmittableAppBarForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableAppBarForm {
      value: $value,
    }''';
  }
}
