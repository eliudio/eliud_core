/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
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

import 'package:eliud_core/model/member_subscription_form_event.dart';
import 'package:eliud_core/model/member_subscription_form_state.dart';
import 'package:eliud_core/model/member_subscription_repository.dart';

class MemberSubscriptionFormBloc extends Bloc<MemberSubscriptionFormEvent, MemberSubscriptionFormState> {
  final String? appId;

  MemberSubscriptionFormBloc(this.appId, ): super(MemberSubscriptionFormUninitialized()) {
      on <InitialiseNewMemberSubscriptionFormEvent> ((event, emit) {
        MemberSubscriptionFormLoaded loaded = MemberSubscriptionFormLoaded(value: MemberSubscriptionModel(
                                               documentID: "IDENTIFIER", 

        ));
        emit(loaded);
      });


      on <InitialiseMemberSubscriptionFormEvent> ((event, emit) async {
        MemberSubscriptionFormLoaded loaded = MemberSubscriptionFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseMemberSubscriptionFormNoLoadEvent> ((event, emit) async {
        MemberSubscriptionFormLoaded loaded = MemberSubscriptionFormLoaded(value: event.value);
        emit(loaded);
      });
      MemberSubscriptionModel? newValue = null;
      on <ChangedMemberSubscriptionApp> ((event, emit) async {
      if (state is MemberSubscriptionFormInitialized) {
        final currentState = state as MemberSubscriptionFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(app: await appRepository(appId: appId)!.get(event.value));
        emit(SubmittableMemberSubscriptionForm(value: newValue));

      }
      });
  }


}

