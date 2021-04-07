/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_form_event.dart';
import 'package:eliud_core/model/member_form_state.dart';
import 'package:eliud_core/model/member_repository.dart';

class MemberFormBloc extends Bloc<MemberFormEvent, MemberFormState> {
  final String? appId;

  MemberFormBloc(this.appId, ): super(MemberFormUninitialized());
  @override
  Stream<MemberFormState> mapEventToState(MemberFormEvent event) async* {
    final MemberFormState currentState = state;
    if (currentState is MemberFormUninitialized) {
      if (event is InitialiseNewMemberFormEvent) {
        MemberFormLoaded loaded = MemberFormLoaded(value: MemberModel(
                                               documentID: "",
                                 name: "",
                                 subscriptions: [],
                                 subscriptionsAsString: [],
                                 photoURL: "",
                                 shipStreet1: "",
                                 shipStreet2: "",
                                 shipCity: "",
                                 shipState: "",
                                 postcode: "",
                                 invoiceSame: true, 
                                 invoiceStreet1: "",
                                 invoiceStreet2: "",
                                 invoiceCity: "",
                                 invoiceState: "",
                                 invoicePostcode: "",
                                 readAccess: [],
                                 email: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseMemberFormEvent) {
        MemberFormLoaded loaded = MemberFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseMemberFormNoLoadEvent) {
        MemberFormLoaded loaded = MemberFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is MemberFormInitialized) {
      MemberModel? newValue = null;
      if (event is ChangedMemberDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberName) {
        newValue = currentState.value!.copyWith(name: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberSubscriptions) {
        newValue = currentState.value!.copyWith(subscriptions: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberShipStreet1) {
        newValue = currentState.value!.copyWith(shipStreet1: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberShipStreet2) {
        newValue = currentState.value!.copyWith(shipStreet2: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberShipCity) {
        newValue = currentState.value!.copyWith(shipCity: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberShipState) {
        newValue = currentState.value!.copyWith(shipState: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberPostcode) {
        newValue = currentState.value!.copyWith(postcode: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberCountry) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(country: await countryRepository(appId: appId).get(event.value));
        else
          newValue = new MemberModel(
                                 documentID: currentState.value!.documentID,
                                 name: currentState.value!.name,
                                 subscriptions: currentState.value!.subscriptions,
                                 subscriptionsAsString: currentState.value!.subscriptionsAsString,
                                 photoURL: currentState.value!.photoURL,
                                 shipStreet1: currentState.value!.shipStreet1,
                                 shipStreet2: currentState.value!.shipStreet2,
                                 shipCity: currentState.value!.shipCity,
                                 shipState: currentState.value!.shipState,
                                 postcode: currentState.value!.postcode,
                                 country: null,
                                 invoiceSame: currentState.value!.invoiceSame,
                                 invoiceStreet1: currentState.value!.invoiceStreet1,
                                 invoiceStreet2: currentState.value!.invoiceStreet2,
                                 invoiceCity: currentState.value!.invoiceCity,
                                 invoiceState: currentState.value!.invoiceState,
                                 invoicePostcode: currentState.value!.invoicePostcode,
                                 invoiceCountry: currentState.value!.invoiceCountry,
                                 readAccess: currentState.value!.readAccess,
                                 email: currentState.value!.email,
                                 isAnonymous: currentState.value!.isAnonymous,
          );
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberInvoiceSame) {
        newValue = currentState.value!.copyWith(invoiceSame: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberInvoiceStreet1) {
        newValue = currentState.value!.copyWith(invoiceStreet1: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberInvoiceStreet2) {
        newValue = currentState.value!.copyWith(invoiceStreet2: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberInvoiceCity) {
        newValue = currentState.value!.copyWith(invoiceCity: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberInvoiceState) {
        newValue = currentState.value!.copyWith(invoiceState: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberInvoicePostcode) {
        newValue = currentState.value!.copyWith(invoicePostcode: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberInvoiceCountry) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(invoiceCountry: await countryRepository(appId: appId).get(event.value));
        else
          newValue = new MemberModel(
                                 documentID: currentState.value!.documentID,
                                 name: currentState.value!.name,
                                 subscriptions: currentState.value!.subscriptions,
                                 subscriptionsAsString: currentState.value!.subscriptionsAsString,
                                 photoURL: currentState.value!.photoURL,
                                 shipStreet1: currentState.value!.shipStreet1,
                                 shipStreet2: currentState.value!.shipStreet2,
                                 shipCity: currentState.value!.shipCity,
                                 shipState: currentState.value!.shipState,
                                 postcode: currentState.value!.postcode,
                                 country: currentState.value!.country,
                                 invoiceSame: currentState.value!.invoiceSame,
                                 invoiceStreet1: currentState.value!.invoiceStreet1,
                                 invoiceStreet2: currentState.value!.invoiceStreet2,
                                 invoiceCity: currentState.value!.invoiceCity,
                                 invoiceState: currentState.value!.invoiceState,
                                 invoicePostcode: currentState.value!.invoicePostcode,
                                 invoiceCountry: null,
                                 readAccess: currentState.value!.readAccess,
                                 email: currentState.value!.email,
                                 isAnonymous: currentState.value!.isAnonymous,
          );
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberEmail) {
        newValue = currentState.value!.copyWith(email: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
      if (event is ChangedMemberIsAnonymous) {
        newValue = currentState.value!.copyWith(isAnonymous: event.value);
        yield SubmittableMemberForm(value: newValue);

        return;
      }
    }
  }


}

