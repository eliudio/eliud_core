/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'blocking_dashboard_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlockingDashboardFormState extends Equatable {
  const BlockingDashboardFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class BlockingDashboardFormUninitialized extends BlockingDashboardFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''BlockingDashboardFormState()''';
  }
}

// BlockingDashboardModel has been initialised and hence BlockingDashboardModel is available
class BlockingDashboardFormInitialized extends BlockingDashboardFormState {
  final BlockingDashboardModel? value;

  @override
  List<Object?> get props => [value];

  const BlockingDashboardFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class BlockingDashboardFormError
    extends BlockingDashboardFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const BlockingDashboardFormError({this.message, super.value});

  @override
  String toString() {
    return '''BlockingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDBlockingDashboardFormError extends BlockingDashboardFormError {
  const DocumentIDBlockingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDBlockingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdBlockingDashboardFormError extends BlockingDashboardFormError {
  const AppIdBlockingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdBlockingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionBlockingDashboardFormError extends BlockingDashboardFormError {
  const DescriptionBlockingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionBlockingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsBlockingDashboardFormError extends BlockingDashboardFormError {
  const ConditionsBlockingDashboardFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsBlockingDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BlockingDashboardFormLoaded extends BlockingDashboardFormInitialized {
  const BlockingDashboardFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''BlockingDashboardFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableBlockingDashboardForm
    extends BlockingDashboardFormInitialized {
  const SubmittableBlockingDashboardForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableBlockingDashboardForm {
      value: $value,
    }''';
  }
}
