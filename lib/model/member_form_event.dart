/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class MemberFormEvent extends Equatable {
  const MemberFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewMemberFormEvent extends MemberFormEvent {
}


class InitialiseMemberFormEvent extends MemberFormEvent {
  final MemberModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberFormEvent({this.value});
}

class InitialiseMemberFormNoLoadEvent extends MemberFormEvent {
  final MemberModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberFormNoLoadEvent({this.value});
}

class ChangedMemberDocumentID extends MemberFormEvent {
  final String value;

  ChangedMemberDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberDocumentID{ value: $value }';
}

class ChangedMemberName extends MemberFormEvent {
  final String value;

  ChangedMemberName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberName{ value: $value }';
}

class ChangedMemberSubscriptions extends MemberFormEvent {
  final List<MemberSubscriptionModel> value;

  ChangedMemberSubscriptions({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberSubscriptions{ value: $value }';
}

class ChangedMemberSubscriptionsAsString extends MemberFormEvent {
  final String value;

  ChangedMemberSubscriptionsAsString({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberSubscriptionsAsString{ value: $value }';
}

class ChangedMemberPhotoURL extends MemberFormEvent {
  final String value;

  ChangedMemberPhotoURL({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberPhotoURL{ value: $value }';
}

class ChangedMemberShipStreet1 extends MemberFormEvent {
  final String value;

  ChangedMemberShipStreet1({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberShipStreet1{ value: $value }';
}

class ChangedMemberShipStreet2 extends MemberFormEvent {
  final String value;

  ChangedMemberShipStreet2({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberShipStreet2{ value: $value }';
}

class ChangedMemberShipCity extends MemberFormEvent {
  final String value;

  ChangedMemberShipCity({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberShipCity{ value: $value }';
}

class ChangedMemberShipState extends MemberFormEvent {
  final String value;

  ChangedMemberShipState({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberShipState{ value: $value }';
}

class ChangedMemberPostcode extends MemberFormEvent {
  final String value;

  ChangedMemberPostcode({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberPostcode{ value: $value }';
}

class ChangedMemberCountry extends MemberFormEvent {
  final String value;

  ChangedMemberCountry({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberCountry{ value: $value }';
}

class ChangedMemberInvoiceSame extends MemberFormEvent {
  final bool value;

  ChangedMemberInvoiceSame({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberInvoiceSame{ value: $value }';
}

class ChangedMemberInvoiceStreet1 extends MemberFormEvent {
  final String value;

  ChangedMemberInvoiceStreet1({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberInvoiceStreet1{ value: $value }';
}

class ChangedMemberInvoiceStreet2 extends MemberFormEvent {
  final String value;

  ChangedMemberInvoiceStreet2({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberInvoiceStreet2{ value: $value }';
}

class ChangedMemberInvoiceCity extends MemberFormEvent {
  final String value;

  ChangedMemberInvoiceCity({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberInvoiceCity{ value: $value }';
}

class ChangedMemberInvoiceState extends MemberFormEvent {
  final String value;

  ChangedMemberInvoiceState({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberInvoiceState{ value: $value }';
}

class ChangedMemberInvoicePostcode extends MemberFormEvent {
  final String value;

  ChangedMemberInvoicePostcode({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberInvoicePostcode{ value: $value }';
}

class ChangedMemberInvoiceCountry extends MemberFormEvent {
  final String value;

  ChangedMemberInvoiceCountry({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberInvoiceCountry{ value: $value }';
}

class ChangedMemberReadAccess extends MemberFormEvent {
  final String value;

  ChangedMemberReadAccess({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberReadAccess{ value: $value }';
}

class ChangedMemberEmail extends MemberFormEvent {
  final String value;

  ChangedMemberEmail({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberEmail{ value: $value }';
}

class ChangedMemberIsAnonymous extends MemberFormEvent {
  final bool value;

  ChangedMemberIsAnonymous({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberIsAnonymous{ value: $value }';
}

