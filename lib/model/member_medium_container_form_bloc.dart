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
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_container_form_event.dart';
import 'package:eliud_core/model/member_medium_container_form_state.dart';
import 'package:eliud_core/model/model_export.dart';

class MemberMediumContainerFormBloc extends Bloc<MemberMediumContainerFormEvent, MemberMediumContainerFormState> {
  final String? appId;

  MemberMediumContainerFormBloc(this.appId, ): super(MemberMediumContainerFormUninitialized());
  @override
  Stream<MemberMediumContainerFormState> mapEventToState(MemberMediumContainerFormEvent event) async* {
    final currentState = state;
    if (currentState is MemberMediumContainerFormUninitialized) {
      on <InitialiseNewMemberMediumContainerFormEvent> ((event, emit) {
        MemberMediumContainerFormLoaded loaded = MemberMediumContainerFormLoaded(value: MemberMediumContainerModel(
                                               documentID: "IDENTIFIER", 

        ));
        emit(loaded);
      });


      if (event is InitialiseMemberMediumContainerFormEvent) {
        MemberMediumContainerFormLoaded loaded = MemberMediumContainerFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseMemberMediumContainerFormNoLoadEvent) {
        MemberMediumContainerFormLoaded loaded = MemberMediumContainerFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is MemberMediumContainerFormInitialized) {
      MemberMediumContainerModel? newValue = null;
      on <ChangedMemberMediumContainerMemberMedium> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(memberMedium: await memberMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableMemberMediumContainerForm(value: newValue));

      });
    }
  }


}

