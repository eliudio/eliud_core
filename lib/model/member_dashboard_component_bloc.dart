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

  MemberDashboardComponentBloc({ this.memberDashboardRepository }): super(MemberDashboardComponentUninitialized());
  @override
  Stream<MemberDashboardComponentState> mapEventToState(MemberDashboardComponentEvent event) async* {
    final MemberDashboardComponentState currentState = state;
    if (event is FetchMemberDashboardComponent) {
      try {
        if (currentState is MemberDashboardComponentUninitialized) {
          bool permissionDenied = false;
          final model = await memberDashboardRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield MemberDashboardComponentPermissionDenied();
          } else {
            if (model != null) {
              yield MemberDashboardComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield MemberDashboardComponentError(
                  message: "MemberDashboard with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield MemberDashboardComponentError(message: "Unknown error whilst retrieving MemberDashboard");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

