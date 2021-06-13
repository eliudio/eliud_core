/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'eliud_style_attributes_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EliudStyleAttributesFormState extends Equatable {
  const EliudStyleAttributesFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class EliudStyleAttributesFormUninitialized extends EliudStyleAttributesFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''EliudStyleAttributesFormState()''';
  }
}

// EliudStyleAttributesModel has been initialised and hence EliudStyleAttributesModel is available
class EliudStyleAttributesFormInitialized extends EliudStyleAttributesFormState {
  final EliudStyleAttributesModel? value;

  @override
  List<Object?> get props => [ value ];

  const EliudStyleAttributesFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class EliudStyleAttributesFormError extends EliudStyleAttributesFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const EliudStyleAttributesFormError({this.message, EliudStyleAttributesModel? value }) : super(value: value);

  @override
  String toString() {
    return '''EliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const DocumentIDEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const DescriptionEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormSubmitButtonColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormSubmitButtonColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormSubmitButtonColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormBackgroundEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormBackgroundEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormBackgroundEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppBackgroundEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const AppBackgroundEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppBackgroundEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormSubmitButtonTextColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormSubmitButtonTextColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormSubmitButtonTextColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormGroupTitleColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormGroupTitleColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormGroupTitleColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormFieldTextColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormFieldTextColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormFieldTextColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormFieldHeaderColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormFieldHeaderColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormFieldHeaderColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormFieldFocusColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormFieldFocusColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormFieldFocusColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormAppBarBackgroundEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormAppBarBackgroundEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormAppBarBackgroundEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormAppBarTextColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FormAppBarTextColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FormAppBarTextColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ListBackgroundEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const ListBackgroundEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ListBackgroundEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ListTextItemColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const ListTextItemColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ListTextItemColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FloatingButtonForegroundColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FloatingButtonForegroundColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FloatingButtonForegroundColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FloatingButtonBackgroundColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FloatingButtonBackgroundColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FloatingButtonBackgroundColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DividerColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const DividerColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DividerColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class IconColorEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const IconColorEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''IconColorEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H1EliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const H1EliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''H1EliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H2EliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const H2EliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''H2EliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H3EliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const H3EliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''H3EliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H4EliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const H4EliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''H4EliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H5EliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const H5EliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''H5EliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontTextEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FontTextEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FontTextEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontHighlight1EliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FontHighlight1EliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FontHighlight1EliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontHighlight2EliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FontHighlight2EliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FontHighlight2EliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontLinkEliudStyleAttributesFormError extends EliudStyleAttributesFormError { 
  const FontLinkEliudStyleAttributesFormError({ String? message, EliudStyleAttributesModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''FontLinkEliudStyleAttributesFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class EliudStyleAttributesFormLoaded extends EliudStyleAttributesFormInitialized { 
  const EliudStyleAttributesFormLoaded({ EliudStyleAttributesModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''EliudStyleAttributesFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableEliudStyleAttributesForm extends EliudStyleAttributesFormInitialized { 
  const SubmittableEliudStyleAttributesForm({ EliudStyleAttributesModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableEliudStyleAttributesForm {
      value: $value,
    }''';
  }
}


