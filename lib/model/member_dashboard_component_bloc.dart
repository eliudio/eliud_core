/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/member_dashboard_component_event.dart';
import 'package:eliud_core/model/member_dashboard_component_state.dart';
import 'package:eliud_core/model/member_dashboard_repository.dart';
import 'package:flutter/services.dart';

class MemberDashboardComponentBloc extends Bloc<MemberDashboardComponentEvent, MemberDashboardComponentState> {
  final MemberDashboardRepository? memberDashboardRepository;
  StreamSubscription? _memberDashboardSubscription;

  Stream<MemberDashboardComponentState> _mapLoadMemberDashboardComponentUpdateToState(String documentId) async* {
    _memberDashboardSubscription?.cancel();
    _memberDashboardSubscription = memberDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) add(MemberDashboardComponentUpdated(value: value));
    });
  }

  MemberDashboardComponentBloc({ this.memberDashboardRepository }): super(MemberDashboardComponentUninitialized());

  @override
  Stream<MemberDashboardComponentState> mapEventToState(MemberDashboardComponentEvent event) async* {
    final currentState = state;
    if (event is FetchMemberDashboardComponent) {
      yield* _mapLoadMemberDashboardComponentUpdateToState(event.id!);
    } else if (event is MemberDashboardComponentUpdated) {
      yield MemberDashboardComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _memberDashboardSubscription?.cancel();
    return super.close();
  }

}

