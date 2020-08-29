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

import 'member_model.dart';
import 'member_component_event.dart';
import 'member_component_state.dart';
import 'member_repository.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final MemberRepository memberRepository;

  MemberBloc({ this.memberRepository }): super(MemberUninitialized());
  @override
  Stream<MemberState> mapEventToState(MemberEvent event) async* {
    final currentState = state;
    if (event is FetchMember) {
      try {
        if (currentState is MemberUninitialized) {
          final MemberModel model = await _fetchMember(event.id);

          if (model != null) {
            yield MemberLoaded(value: model);
          } else {
            String id = event.id;
            yield MemberError(message: "Member with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield MemberError(message: "Unknown error whilst retrieving Member");
      }
    }
  }

  Future<MemberModel> _fetchMember(String id) async {
    return memberRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


