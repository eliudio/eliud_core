/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_component_event.dart';
import 'package:eliud_core/model/member_component_state.dart';
import 'package:eliud_core/model/member_repository.dart';
import 'package:flutter/services.dart';


class MemberComponentBloc extends Bloc<MemberComponentEvent, MemberComponentState> {
  final MemberRepository? memberRepository;
  StreamSubscription? _memberSubscription;

  Stream<MemberComponentState> _mapLoadMemberComponentUpdateToState(String documentId) async* {
    _memberSubscription?.cancel();
    _memberSubscription = memberRepository!.listenTo(documentId, (value) {
      if (value != null) add(MemberComponentUpdated(value: value));
    });
  }

  MemberComponentBloc({ this.memberRepository }): super(MemberComponentUninitialized());

  @override
  Stream<MemberComponentState> mapEventToState(MemberComponentEvent event) async* {
    final currentState = state;
    if (event is FetchMemberComponent) {
      yield* _mapLoadMemberComponentUpdateToState(event.id!);
    } else if (event is MemberComponentUpdated) {
      yield MemberComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _memberSubscription?.cancel();
    return super.close();
  }

}

