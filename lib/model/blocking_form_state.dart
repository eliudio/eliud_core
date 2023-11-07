/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'blocking_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlockingFormState extends Equatable {
  const BlockingFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class BlockingFormUninitialized extends BlockingFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''BlockingFormState()''';
  }
}

// BlockingModel has been initialised and hence BlockingModel is available
class BlockingFormInitialized extends BlockingFormState {
  final BlockingModel? value;

  @override
  List<Object?> get props => [value];

  const BlockingFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class BlockingFormError extends BlockingFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const BlockingFormError({this.message, super.value});

  @override
  String toString() {
    return '''BlockingFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDBlockingFormError extends BlockingFormError {
  const DocumentIDBlockingFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDBlockingFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberBlockingBlockingFormError extends BlockingFormError {
  const MemberBlockingBlockingFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberBlockingBlockingFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberBeingBlockedBlockingFormError extends BlockingFormError {
  const MemberBeingBlockedBlockingFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberBeingBlockedBlockingFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BlockingFormLoaded extends BlockingFormInitialized {
  const BlockingFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''BlockingFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableBlockingForm extends BlockingFormInitialized {
  const SubmittableBlockingForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableBlockingForm {
      value: $value,
    }''';
  }
}
