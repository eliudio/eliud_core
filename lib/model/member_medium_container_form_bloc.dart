/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_form_bloc.dart
                       
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

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_medium_container_form_event.dart';
import 'package:eliud_core/model/member_medium_container_form_state.dart';
import 'package:eliud_core/model/member_medium_container_repository.dart';

class MemberMediumContainerFormBloc extends Bloc<MemberMediumContainerFormEvent, MemberMediumContainerFormState> {
  final String? appId;

  MemberMediumContainerFormBloc(this.appId, ): super(MemberMediumContainerFormUninitialized()) {
      on <InitialiseNewMemberMediumContainerFormEvent> ((event, emit) {
        MemberMediumContainerFormLoaded loaded = MemberMediumContainerFormLoaded(value: MemberMediumContainerModel(
                                               documentID: "IDENTIFIER", 

        ));
        emit(loaded);
      });


      on <InitialiseMemberMediumContainerFormEvent> ((event, emit) async {
        MemberMediumContainerFormLoaded loaded = MemberMediumContainerFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseMemberMediumContainerFormNoLoadEvent> ((event, emit) async {
        MemberMediumContainerFormLoaded loaded = MemberMediumContainerFormLoaded(value: event.value);
        emit(loaded);
      });
      MemberMediumContainerModel? newValue = null;
      on <ChangedMemberMediumContainerMemberMedium> ((event, emit) async {
      if (state is MemberMediumContainerFormInitialized) {
        final currentState = state as MemberMediumContainerFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(memberMedium: await memberMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableMemberMediumContainerForm(value: newValue));

      }
      });
  }


}

