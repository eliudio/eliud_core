/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberFormState extends Equatable {
  const MemberFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberFormUninitialized extends MemberFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MemberFormState()''';
  }
}

// MemberModel has been initialised and hence MemberModel is available
class MemberFormInitialized extends MemberFormState {
  final MemberModel? value;

  @override
  List<Object?> get props => [value];

  const MemberFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class MemberFormError extends MemberFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const MemberFormError({this.message, super.value});

  @override
  String toString() {
    return '''MemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDMemberFormError extends MemberFormError {
  const DocumentIDMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameMemberFormError extends MemberFormError {
  const NameMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SubscriptionsMemberFormError extends MemberFormError {
  const SubscriptionsMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SubscriptionsMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SubscriptionsAsStrArrMemberFormError extends MemberFormError {
  const SubscriptionsAsStrArrMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SubscriptionsAsStrArrMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PhotoMemberFormError extends MemberFormError {
  const PhotoMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PhotoMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PhotoURLMemberFormError extends MemberFormError {
  const PhotoURLMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PhotoURLMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipStreet1MemberFormError extends MemberFormError {
  const ShipStreet1MemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipStreet1MemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipStreet2MemberFormError extends MemberFormError {
  const ShipStreet2MemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipStreet2MemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipCityMemberFormError extends MemberFormError {
  const ShipCityMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipCityMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipStateMemberFormError extends MemberFormError {
  const ShipStateMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipStateMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostcodeMemberFormError extends MemberFormError {
  const PostcodeMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PostcodeMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CountryMemberFormError extends MemberFormError {
  const CountryMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CountryMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceSameMemberFormError extends MemberFormError {
  const InvoiceSameMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceSameMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceStreet1MemberFormError extends MemberFormError {
  const InvoiceStreet1MemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceStreet1MemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceStreet2MemberFormError extends MemberFormError {
  const InvoiceStreet2MemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceStreet2MemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceCityMemberFormError extends MemberFormError {
  const InvoiceCityMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceCityMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceStateMemberFormError extends MemberFormError {
  const InvoiceStateMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceStateMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoicePostcodeMemberFormError extends MemberFormError {
  const InvoicePostcodeMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoicePostcodeMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceCountryMemberFormError extends MemberFormError {
  const InvoiceCountryMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceCountryMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class EmailMemberFormError extends MemberFormError {
  const EmailMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''EmailMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class IsAnonymousMemberFormError extends MemberFormError {
  const IsAnonymousMemberFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''IsAnonymousMemberFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberFormLoaded extends MemberFormInitialized {
  const MemberFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''MemberFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableMemberForm extends MemberFormInitialized {
  const SubmittableMemberForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableMemberForm {
      value: $value,
    }''';
  }
}
