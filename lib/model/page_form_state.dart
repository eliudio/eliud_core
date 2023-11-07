/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'page_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageFormState extends Equatable {
  const PageFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PageFormUninitialized extends PageFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PageFormState()''';
  }
}

// PageModel has been initialised and hence PageModel is available
class PageFormInitialized extends PageFormState {
  final PageModel? value;

  @override
  List<Object?> get props => [value];

  const PageFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PageFormError extends PageFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PageFormError({this.message, super.value});

  @override
  String toString() {
    return '''PageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPageFormError extends PageFormError {
  const DocumentIDPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdPageFormError extends PageFormError {
  const AppIdPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionPageFormError extends PageFormError {
  const DescriptionPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TitlePageFormError extends PageFormError {
  const TitlePageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TitlePageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppBarPageFormError extends PageFormError {
  const AppBarPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppBarPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DrawerPageFormError extends PageFormError {
  const DrawerPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DrawerPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class EndDrawerPageFormError extends PageFormError {
  const EndDrawerPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''EndDrawerPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class HomeMenuPageFormError extends PageFormError {
  const HomeMenuPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''HomeMenuPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BodyComponentsPageFormError extends PageFormError {
  const BodyComponentsPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BodyComponentsPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BackgroundOverridePageFormError extends PageFormError {
  const BackgroundOverridePageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BackgroundOverridePageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class LayoutPageFormError extends PageFormError {
  const LayoutPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''LayoutPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class GridViewPageFormError extends PageFormError {
  const GridViewPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''GridViewPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsPageFormError extends PageFormError {
  const ConditionsPageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsPageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PageFormLoaded extends PageFormInitialized {
  const PageFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PageFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePageForm extends PageFormInitialized {
  const SubmittablePageForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePageForm {
      value: $value,
    }''';
  }
}
