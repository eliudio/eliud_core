/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:eliud_core/model/member_public_info_component_event.dart';
import 'package:eliud_core/model/member_public_info_component_state.dart';
import 'package:eliud_core/model/member_public_info_repository.dart';
import 'package:flutter/services.dart';

class MemberPublicInfoComponentBloc extends Bloc<MemberPublicInfoComponentEvent, MemberPublicInfoComponentState> {
  final MemberPublicInfoRepository? memberPublicInfoRepository;
  StreamSubscription? _memberPublicInfoSubscription;

  Stream<MemberPublicInfoComponentState> _mapLoadMemberPublicInfoComponentUpdateToState(String documentId) async* {
    _memberPublicInfoSubscription?.cancel();
    _memberPublicInfoSubscription = memberPublicInfoRepository!.listenTo(documentId, (value) {
      if (value != null) add(MemberPublicInfoComponentUpdated(value: value!));
    });
  }

  MemberPublicInfoComponentBloc({ this.memberPublicInfoRepository }): super(MemberPublicInfoComponentUninitialized());

  @override
  Stream<MemberPublicInfoComponentState> mapEventToState(MemberPublicInfoComponentEvent event) async* {
    final currentState = state;
    if (event is FetchMemberPublicInfoComponent) {
      yield* _mapLoadMemberPublicInfoComponentUpdateToState(event.id!);
    } else if (event is MemberPublicInfoComponentUpdated) {
      yield MemberPublicInfoComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _memberPublicInfoSubscription?.cancel();
    return super.close();
  }

}

