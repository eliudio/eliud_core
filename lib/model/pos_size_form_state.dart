/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'pos_size_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PosSizeFormState extends Equatable {
  const PosSizeFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PosSizeFormUninitialized extends PosSizeFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PosSizeFormState()''';
  }
}

// PosSizeModel has been initialised and hence PosSizeModel is available
class PosSizeFormInitialized extends PosSizeFormState {
  final PosSizeModel? value;

  @override
  List<Object?> get props => [ value ];

  const PosSizeFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class PosSizeFormError extends PosSizeFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const PosSizeFormError({this.message, PosSizeModel? value }) : super(value: value);

  @override
  String toString() {
    return '''PosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDPosSizeFormError extends PosSizeFormError { 
  const DocumentIDPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdPosSizeFormError extends PosSizeFormError { 
  const AppIdPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NamePosSizeFormError extends PosSizeFormError { 
  const NamePosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''NamePosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class WidthPortraitPosSizeFormError extends PosSizeFormError { 
  const WidthPortraitPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''WidthPortraitPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class WidthTypePortraitPosSizeFormError extends PosSizeFormError { 
  const WidthTypePortraitPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''WidthTypePortraitPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class WidthLandscapePosSizeFormError extends PosSizeFormError { 
  const WidthLandscapePosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''WidthLandscapePosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class WidthTypeLandscapePosSizeFormError extends PosSizeFormError { 
  const WidthTypeLandscapePosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''WidthTypeLandscapePosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HeightPortraitPosSizeFormError extends PosSizeFormError { 
  const HeightPortraitPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HeightPortraitPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HeightTypePortraitPosSizeFormError extends PosSizeFormError { 
  const HeightTypePortraitPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HeightTypePortraitPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HeightLandscapePosSizeFormError extends PosSizeFormError { 
  const HeightLandscapePosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HeightLandscapePosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HeightTypeLandscapePosSizeFormError extends PosSizeFormError { 
  const HeightTypeLandscapePosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HeightTypeLandscapePosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FitPortraitPosSizeFormError extends PosSizeFormError { 
  const FitPortraitPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FitPortraitPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FitLandscapePosSizeFormError extends PosSizeFormError { 
  const FitLandscapePosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FitLandscapePosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AlignTypePortraitPosSizeFormError extends PosSizeFormError { 
  const AlignTypePortraitPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AlignTypePortraitPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AlignTypeLandscapePosSizeFormError extends PosSizeFormError { 
  const AlignTypeLandscapePosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AlignTypeLandscapePosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ClipPosSizeFormError extends PosSizeFormError { 
  const ClipPosSizeFormError({ String? message, PosSizeModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ClipPosSizeFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PosSizeFormLoaded extends PosSizeFormInitialized { 
  const PosSizeFormLoaded({ PosSizeModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''PosSizeFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittablePosSizeForm extends PosSizeFormInitialized { 
  const SubmittablePosSizeForm({ PosSizeModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittablePosSizeForm {
      value: $value,
    }''';
  }
}


