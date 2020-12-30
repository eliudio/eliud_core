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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';

import 'package:eliud_core/core/access/bloc/access_state.dart';

class MemberListBloc extends Bloc<MemberListEvent, MemberListState> {
  final MemberRepository _memberRepository;
  StreamSubscription _membersListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  MemberListBloc(this.accessBloc,{ this.eliudQuery, @required MemberRepository memberRepository })
      : assert(memberRepository != null),
      _memberRepository = memberRepository,
      super(MemberListLoading());
  String _currentMember() {
    var _currentMember = '';
    var state = accessBloc.state;
    if (state is LoggedIn) _currentMember = state.member.documentID;
    return _currentMember;
  }

  Stream<MemberListState> _mapLoadMemberListToState({ String orderBy, bool descending }) async* {
    _membersListSubscription?.cancel();
    _membersListSubscription = _memberRepository.listen((list) => add(MemberListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, currentMember: _currentMember(), );
  }

  Stream<MemberListState> _mapLoadMemberListWithDetailsToState() async* {
    _membersListSubscription?.cancel();
    _membersListSubscription = _memberRepository.listenWithDetails((list) => add(MemberListUpdated(value: list)), currentMember: _currentMember(), );
  }

  Stream<MemberListState> _mapAddMemberListToState(AddMemberList event) async* {
    _memberRepository.add(event.value);
  }

  Stream<MemberListState> _mapUpdateMemberListToState(UpdateMemberList event) async* {
    var state = accessBloc.state;
    if (state is LoggedIn) {
        // normally I can only update myself, but checking regardless
        if (event.value.documentID == state.member.documentID) {
            await accessBloc.add(MemberUpdated(event.value));
        }
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
      yield* _mapLoadMemberListToState(orderBy: event.orderBy, descending: event.descending);
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


