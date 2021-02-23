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
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class AppFormUninitialized extends AppFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''AppFormState()''';
  }
}

// AppModel has been initialised and hence AppModel is available
class AppFormInitialized extends AppFormState {
  final AppModel value;

  @override
  List<Object> get props => [ value ];

  const AppFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class AppFormError extends AppFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const AppFormError({this.message, AppModel value }) : super(value: value);

  @override
  String toString() {
    return '''AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDAppFormError extends AppFormError { 
  const DocumentIDAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class OwnerIDAppFormError extends AppFormError { 
  const OwnerIDAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''OwnerIDAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleAppFormError extends AppFormError { 
  const TitleAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class EmailAppFormError extends AppFormError { 
  const EmailAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''EmailAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionAppFormError extends AppFormError { 
  const DescriptionAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppStatusAppFormError extends AppFormError { 
  const AppStatusAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppStatusAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DarkOrLightAppFormError extends AppFormError { 
  const DarkOrLightAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DarkOrLightAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HomePagesAppFormError extends AppFormError { 
  const HomePagesAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''HomePagesAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class LogoAppFormError extends AppFormError { 
  const LogoAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''LogoAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormSubmitButtonColorAppFormError extends AppFormError { 
  const FormSubmitButtonColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormSubmitButtonColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormBackgroundAppFormError extends AppFormError { 
  const FormBackgroundAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormBackgroundAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormSubmitButtonTextColorAppFormError extends AppFormError { 
  const FormSubmitButtonTextColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormSubmitButtonTextColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormGroupTitleColorAppFormError extends AppFormError { 
  const FormGroupTitleColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormGroupTitleColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormFieldTextColorAppFormError extends AppFormError { 
  const FormFieldTextColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormFieldTextColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormFieldHeaderColorAppFormError extends AppFormError { 
  const FormFieldHeaderColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormFieldHeaderColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormFieldFocusColorAppFormError extends AppFormError { 
  const FormFieldFocusColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormFieldFocusColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormAppBarBackgroundAppFormError extends AppFormError { 
  const FormAppBarBackgroundAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormAppBarBackgroundAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FormAppBarTextColorAppFormError extends AppFormError { 
  const FormAppBarTextColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FormAppBarTextColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ListBackgroundAppFormError extends AppFormError { 
  const ListBackgroundAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ListBackgroundAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ListTextItemColorAppFormError extends AppFormError { 
  const ListTextItemColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ListTextItemColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FloatingButtonForegroundColorAppFormError extends AppFormError { 
  const FloatingButtonForegroundColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FloatingButtonForegroundColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FloatingButtonBackgroundColorAppFormError extends AppFormError { 
  const FloatingButtonBackgroundColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FloatingButtonBackgroundColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DividerColorAppFormError extends AppFormError { 
  const DividerColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DividerColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class IconColorAppFormError extends AppFormError { 
  const IconColorAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''IconColorAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RouteBuilderAppFormError extends AppFormError { 
  const RouteBuilderAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''RouteBuilderAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class RouteAnimationDurationAppFormError extends AppFormError { 
  const RouteAnimationDurationAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''RouteAnimationDurationAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class LogoURLAppFormError extends AppFormError { 
  const LogoURLAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''LogoURLAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H1AppFormError extends AppFormError { 
  const H1AppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''H1AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H2AppFormError extends AppFormError { 
  const H2AppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''H2AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H3AppFormError extends AppFormError { 
  const H3AppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''H3AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H4AppFormError extends AppFormError { 
  const H4AppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''H4AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class H5AppFormError extends AppFormError { 
  const H5AppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''H5AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontTextAppFormError extends AppFormError { 
  const FontTextAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FontTextAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontHighlight1AppFormError extends AppFormError { 
  const FontHighlight1AppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FontHighlight1AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontHighlight2AppFormError extends AppFormError { 
  const FontHighlight2AppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FontHighlight2AppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class FontLinkAppFormError extends AppFormError { 
  const FontLinkAppFormError({ String message, AppModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''FontLinkAppFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppFormLoaded extends AppFormInitialized { 
  const AppFormLoaded({ AppModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''AppFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableAppForm extends AppFormInitialized { 
  const SubmittableAppForm({ AppModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableAppForm {
      value: $value,
    }''';
  }
}


