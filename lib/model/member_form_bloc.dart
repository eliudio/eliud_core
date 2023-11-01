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


import 'package:bloc/bloc.dart';




import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/member_form_event.dart';
import 'package:eliud_core/model/member_form_state.dart';

class MemberFormBloc extends Bloc<MemberFormEvent, MemberFormState> {
  final String? appId;

  MemberFormBloc(this.appId, ): super(MemberFormUninitialized()) {
      on <InitialiseNewMemberFormEvent> ((event, emit) {
        MemberFormLoaded loaded = MemberFormLoaded(value: MemberModel(
                                               documentID: "",
                                 name: "",
                                 subscriptions: [],
                                 subscriptionsAsStrArr: [],
                                 photoURL: "",
                                 shipStreet1: "",
                                 shipStreet2: "",
                                 shipCity: "",
                                 shipState: "",
                                 postcode: "",
                                 country: "",
                                 invoiceSame: true, 
                                 invoiceStreet1: "",
                                 invoiceStreet2: "",
                                 invoiceCity: "",
                                 invoiceState: "",
                                 invoicePostcode: "",
                                 invoiceCountry: "",
                                 email: "",

        ));
        emit(loaded);
      });


      on <InitialiseMemberFormEvent> ((event, emit) async {
        MemberFormLoaded loaded = MemberFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseMemberFormNoLoadEvent> ((event, emit) async {
        MemberFormLoaded loaded = MemberFormLoaded(value: event.value);
        emit(loaded);
      });
      MemberModel? newValue = null;
      on <ChangedMemberDocumentID> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberName> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberSubscriptions> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(subscriptions: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberPhoto> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(photo: await publicMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberShipStreet1> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(shipStreet1: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberShipStreet2> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(shipStreet2: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberShipCity> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(shipCity: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberShipState> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(shipState: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberPostcode> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(postcode: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberCountry> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(country: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberInvoiceSame> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(invoiceSame: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberInvoiceStreet1> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(invoiceStreet1: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberInvoiceStreet2> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(invoiceStreet2: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberInvoiceCity> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(invoiceCity: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberInvoiceState> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(invoiceState: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberInvoicePostcode> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(invoicePostcode: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberInvoiceCountry> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(invoiceCountry: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberEmail> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(email: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
      on <ChangedMemberIsAnonymous> ((event, emit) async {
      if (state is MemberFormInitialized) {
        final currentState = state as MemberFormInitialized;
        newValue = currentState.value!.copyWith(isAnonymous: event.value);
        emit(SubmittableMemberForm(value: newValue));

      }
      });
  }


}

