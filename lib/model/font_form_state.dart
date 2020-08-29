/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'font_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FontFormState extends Equatable {
  const FontFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class FontFormUninitialized extends FontFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''FontFormState()''';
  }
}

// FontModel has been initialised and hence FontModel is available
class FontFormInitialized extends FontFormState {
  final FontModel value;

  @override
  List<Object> get props => [ value ];

  const FontFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class FontFormError extends FontFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const FontFormError({this.message, FontModel value }) : super(value: value);

  @override
  String toString() {
    return '''FontFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDFontFormError extends FontFormError { 
  const DocumentIDFontFormError({ String message, FontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDFontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdFontFormError extends FontFormError { 
  const AppIdFontFormError({ String message, FontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdFontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontNameFontFormError extends FontFormError { 
  const FontNameFontFormError({ String message, FontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FontNameFontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class SizeFontFormError extends FontFormError { 
  const SizeFontFormError({ String message, FontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''SizeFontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class WeightFontFormError extends FontFormError { 
  const WeightFontFormError({ String message, FontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''WeightFontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class StyleFontFormError extends FontFormError { 
  const StyleFontFormError({ String message, FontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''StyleFontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DecorationFontFormError extends FontFormError { 
  const DecorationFontFormError({ String message, FontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DecorationFontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ColorFontFormError extends FontFormError { 
  const ColorFontFormError({ String message, FontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ColorFontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontFormLoaded extends FontFormInitialized { 
  const FontFormLoaded({ FontModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''FontFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableFontForm extends FontFormInitialized { 
  const SubmittableFontForm({ FontModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableFontForm {
      value: $value,
    }''';
  }
}


