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

import 'package:eliud_core/model/member_component_event.dart';
import 'package:eliud_core/model/member_component_state.dart';
import 'package:eliud_core/model/member_repository.dart';

class MemberComponentBloc
    extends Bloc<MemberComponentEvent, MemberComponentState> {
  final MemberRepository? memberRepository;
  StreamSubscription? _memberSubscription;

  void _mapLoadMemberComponentUpdateToState(String documentId) {
    _memberSubscription?.cancel();
    _memberSubscription = memberRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(MemberComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct MemberComponentBloc
   */
  MemberComponentBloc({this.memberRepository})
      : super(MemberComponentUninitialized()) {
    on<FetchMemberComponent>((event, emit) {
      _mapLoadMemberComponentUpdateToState(event.id!);
    });
    on<MemberComponentUpdated>((event, emit) {
      emit(MemberComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the MemberComponentBloc
   */
  @override
  Future<void> close() {
    _memberSubscription?.cancel();
    return super.close();
  }
}
