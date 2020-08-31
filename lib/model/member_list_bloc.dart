/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/member_repository.dart';
import 'package:eliud_core/model/member_list_event.dart';
import 'package:eliud_core/model/member_list_state.dart';

import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/global_data.dart';


class MemberListBloc extends Bloc<MemberListEvent, MemberListState> {
  final MemberRepository _memberRepository;
  StreamSubscription _membersListSubscription;

  MemberListBloc({ @required MemberRepository memberRepository })
      : assert(memberRepository != null),
      _memberRepository = memberRepository,
      super(MemberListLoading());

  Stream<MemberListState> _mapLoadMemberListToState() async* {
    _membersListSubscription?.cancel();
    _membersListSubscription = _memberRepository.listen((list) => add(MemberListUpdated(value: list)));
  }

  Stream<MemberListState> _mapLoadMemberListWithDetailsToState() async* {
    _membersListSubscription?.cancel();
    _membersListSubscription = _memberRepository.listenWithDetails((list) => add(MemberListUpdated(value: list)));
  }

  Stream<MemberListState> _mapAddMemberListToState(AddMemberList event) async* {
    _memberRepository.add(event.value);
  }

  Stream<MemberListState> _mapUpdateMemberListToState(UpdateMemberList event) async* {
var state = GlobalData.state();
    if (state is LoggedIn) {
        AccessState accessState = state.copyWith(member: event.value);
        GlobalData.init(accessState);
    }
    _memberRepository.update(event.value);
  }

  Stream<MemberListState> _mapDeleteMemberListToState(DeleteMemberList event) async* {
    _memberRepository.delete(event.value);
  }

  Stream<MemberListState> _mapMemberListUpdatedToState(MemberListUpdated event) async* {
    yield MemberListLoaded(values: event.value);
  }


  @override
  Stream<MemberListState> mapEventToState(MemberListEvent event) async* {
    final currentState = state;
    if (event is LoadMemberList) {
      yield* _mapLoadMemberListToState();
    } if (event is LoadMemberListWithDetails) {
      yield* _mapLoadMemberListWithDetailsToState();
    } else if (event is AddMemberList) {
      yield* _mapAddMemberListToState(event);
    } else if (event is UpdateMemberList) {
      yield* _mapUpdateMemberListToState(event);
    } else if (event is DeleteMemberList) {
      yield* _mapDeleteMemberListToState(event);
    } else if (event is MemberListUpdated) {
      yield* _mapMemberListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _membersListSubscription?.cancel();
    return super.close();
  }

}


