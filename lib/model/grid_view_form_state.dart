/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'grid_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GridViewFormState extends Equatable {
  const GridViewFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class GridViewFormUninitialized extends GridViewFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''GridViewFormState()''';
  }
}

// GridViewModel has been initialised and hence GridViewModel is available
class GridViewFormInitialized extends GridViewFormState {
  final GridViewModel? value;

  @override
  List<Object?> get props => [value];

  const GridViewFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class GridViewFormError extends GridViewFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const GridViewFormError({this.message, super.value});

  @override
  String toString() {
    return '''GridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDGridViewFormError extends GridViewFormError {
  const DocumentIDGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdGridViewFormError extends GridViewFormError {
  const AppIdGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameGridViewFormError extends GridViewFormError {
  const NameGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ScrollDirectionGridViewFormError extends GridViewFormError {
  const ScrollDirectionGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ScrollDirectionGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TypeGridViewFormError extends GridViewFormError {
  const TypeGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TypeGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CrossAxisCountGridViewFormError extends GridViewFormError {
  const CrossAxisCountGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CrossAxisCountGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MaxCrossAxisExtentTypeGridViewFormError extends GridViewFormError {
  const MaxCrossAxisExtentTypeGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MaxCrossAxisExtentTypeGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AbsoluteMaxCrossAxisExtentGridViewFormError extends GridViewFormError {
  const AbsoluteMaxCrossAxisExtentGridViewFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AbsoluteMaxCrossAxisExtentGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RelativeMaxCrossAxisExtentGridViewFormError extends GridViewFormError {
  const RelativeMaxCrossAxisExtentGridViewFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RelativeMaxCrossAxisExtentGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ChildAspectRatioGridViewFormError extends GridViewFormError {
  const ChildAspectRatioGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ChildAspectRatioGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PaddingGridViewFormError extends GridViewFormError {
  const PaddingGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PaddingGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MainAxisSpacingGridViewFormError extends GridViewFormError {
  const MainAxisSpacingGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MainAxisSpacingGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CrossAxisSpacingGridViewFormError extends GridViewFormError {
  const CrossAxisSpacingGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CrossAxisSpacingGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsGridViewFormError extends GridViewFormError {
  const ConditionsGridViewFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsGridViewFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class GridViewFormLoaded extends GridViewFormInitialized {
  const GridViewFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''GridViewFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableGridViewForm extends GridViewFormInitialized {
  const SubmittableGridViewForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableGridViewForm {
      value: $value,
    }''';
  }
}
