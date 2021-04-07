/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'drawer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DrawerFormState extends Equatable {
  const DrawerFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DrawerFormUninitialized extends DrawerFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''DrawerFormState()''';
  }
}

// DrawerModel has been initialised and hence DrawerModel is available
class DrawerFormInitialized extends DrawerFormState {
  final DrawerModel? value;

  @override
  List<Object?> get props => [ value ];

  const DrawerFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class DrawerFormError extends DrawerFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const DrawerFormError({this.message, DrawerModel? value }) : super(value: value);

  @override
  String toString() {
    return '''DrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDDrawerFormError extends DrawerFormError { 
  const DocumentIDDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdDrawerFormError extends DrawerFormError { 
  const AppIdDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NameDrawerFormError extends DrawerFormError { 
  const NameDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''NameDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BackgroundDrawerFormError extends DrawerFormError { 
  const BackgroundDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''BackgroundDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HeaderTextDrawerFormError extends DrawerFormError { 
  const HeaderTextDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HeaderTextDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class SecondHeaderTextDrawerFormError extends DrawerFormError { 
  const SecondHeaderTextDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''SecondHeaderTextDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HeaderHeightDrawerFormError extends DrawerFormError { 
  const HeaderHeightDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HeaderHeightDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PopupMenuBackgroundColorDrawerFormError extends DrawerFormError { 
  const PopupMenuBackgroundColorDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''PopupMenuBackgroundColorDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HeaderBackgroundDrawerFormError extends DrawerFormError { 
  const HeaderBackgroundDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HeaderBackgroundDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MenuDrawerFormError extends DrawerFormError { 
  const MenuDrawerFormError({ String? message, DrawerModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MenuDrawerFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DrawerFormLoaded extends DrawerFormInitialized { 
  const DrawerFormLoaded({ DrawerModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''DrawerFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableDrawerForm extends DrawerFormInitialized { 
  const SubmittableDrawerForm({ DrawerModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableDrawerForm {
      value: $value,
    }''';
  }
}


