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

  MemberComponentBloc({ this.memberRepository }): super(MemberComponentUninitialized());
  @override
  Stream<MemberComponentState> mapEventToState(MemberComponentEvent event) async* {
    final MemberComponentState currentState = state;
    if (event is FetchMemberComponent) {
      try {
        if (currentState is MemberComponentUninitialized) {
          bool permissionDenied = false;
          final model = await memberRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield MemberComponentPermissionDenied();
          } else {
            if (model != null) {
              yield MemberComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield MemberComponentError(
                  message: "Member with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield MemberComponentError(message: "Unknown error whilst retrieving Member");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

