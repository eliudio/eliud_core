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

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/member_subscription_form_event.dart';
import 'package:eliud_core/model/member_subscription_form_state.dart';

class MemberSubscriptionFormBloc
    extends Bloc<MemberSubscriptionFormEvent, MemberSubscriptionFormState> {
  final String? appId;

  MemberSubscriptionFormBloc(
    this.appId,
  ) : super(MemberSubscriptionFormUninitialized()) {
    on<InitialiseNewMemberSubscriptionFormEvent>((event, emit) {
      MemberSubscriptionFormLoaded loaded = MemberSubscriptionFormLoaded(
          value: MemberSubscriptionModel(
        documentID: "IDENTIFIER",
      ));
      emit(loaded);
    });

    on<InitialiseMemberSubscriptionFormEvent>((event, emit) async {
      MemberSubscriptionFormLoaded loaded =
          MemberSubscriptionFormLoaded(value: event.value);
      emit(loaded);
    });
    on<InitialiseMemberSubscriptionFormNoLoadEvent>((event, emit) async {
      MemberSubscriptionFormLoaded loaded =
          MemberSubscriptionFormLoaded(value: event.value);
      emit(loaded);
    });
    MemberSubscriptionModel? newValue;
    on<ChangedMemberSubscriptionApp>((event, emit) async {
      if (state is MemberSubscriptionFormInitialized) {
        final currentState = state as MemberSubscriptionFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              app: await appRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableMemberSubscriptionForm(value: newValue));
      }
    });
  }
}
