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

import 'package:eliud_core/model/member_dashboard_component_event.dart';
import 'package:eliud_core/model/member_dashboard_component_state.dart';
import 'package:eliud_core/model/member_dashboard_repository.dart';

class MemberDashboardComponentBloc extends Bloc<MemberDashboardComponentEvent, MemberDashboardComponentState> {
  final MemberDashboardRepository? memberDashboardRepository;
  StreamSubscription? _memberDashboardSubscription;

  void _mapLoadMemberDashboardComponentUpdateToState(String documentId) {
    _memberDashboardSubscription?.cancel();
    _memberDashboardSubscription = memberDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(MemberDashboardComponentUpdated(value: value));
      }
    });
  }

  MemberDashboardComponentBloc({ this.memberDashboardRepository }): super(MemberDashboardComponentUninitialized()) {
    on <FetchMemberDashboardComponent> ((event, emit) {
      _mapLoadMemberDashboardComponentUpdateToState(event.id!);
    });
    on <MemberDashboardComponentUpdated> ((event, emit) {
      emit(MemberDashboardComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _memberDashboardSubscription?.cancel();
    return super.close();
  }

}

