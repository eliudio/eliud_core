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
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_subscription_form_event.dart';
import 'package:eliud_core/model/member_subscription_form_state.dart';
import 'package:eliud_core/model/member_subscription_repository.dart';

class MemberSubscriptionFormBloc extends Bloc<MemberSubscriptionFormEvent, MemberSubscriptionFormState> {
  final AppRepository _appRepository = appRepository();

  MemberSubscriptionFormBloc(): super(MemberSubscriptionFormUninitialized());
  @override
  Stream<MemberSubscriptionFormState> mapEventToState(MemberSubscriptionFormEvent event) async* {
    final currentState = state;
    if (currentState is MemberSubscriptionFormUninitialized) {
      if (event is InitialiseNewMemberSubscriptionFormEvent) {
        MemberSubscriptionFormLoaded loaded = MemberSubscriptionFormLoaded(value: MemberSubscriptionModel(
                                               documentID: "IDENTIFIER", 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseMemberSubscriptionFormEvent) {
        MemberSubscriptionFormLoaded loaded = MemberSubscriptionFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseMemberSubscriptionFormNoLoadEvent) {
        MemberSubscriptionFormLoaded loaded = MemberSubscriptionFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is MemberSubscriptionFormInitialized) {
      MemberSubscriptionModel newValue = null;
      if (event is ChangedMemberSubscriptionApp) {
        if (event.value != null)
          newValue = currentState.value.copyWith(app: await _appRepository.get(event.value));
        else
          newValue = new MemberSubscriptionModel(
                                 documentID: currentState.value.documentID,
                                 app: null,
          );
        yield SubmittableMemberSubscriptionForm(value: newValue);

        return;
      }
    }
  }


}

