/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'decoration_color_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DecorationColorFormState extends Equatable {
  const DecorationColorFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DecorationColorFormUninitialized extends DecorationColorFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''DecorationColorFormState()''';
  }
}

// DecorationColorModel has been initialised and hence DecorationColorModel is available
class DecorationColorFormInitialized extends DecorationColorFormState {
  final DecorationColorModel? value;

  @override
  List<Object?> get props => [value];

  const DecorationColorFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class DecorationColorFormError extends DecorationColorFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const DecorationColorFormError({this.message, super.value});

  @override
  String toString() {
    return '''DecorationColorFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDDecorationColorFormError extends DecorationColorFormError {
  const DocumentIDDecorationColorFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDDecorationColorFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ColorDecorationColorFormError extends DecorationColorFormError {
  const ColorDecorationColorFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ColorDecorationColorFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class StopDecorationColorFormError extends DecorationColorFormError {
  const StopDecorationColorFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''StopDecorationColorFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DecorationColorFormLoaded extends DecorationColorFormInitialized {
  const DecorationColorFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''DecorationColorFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableDecorationColorForm extends DecorationColorFormInitialized {
  const SubmittableDecorationColorForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableDecorationColorForm {
      value: $value,
    }''';
  }
}
