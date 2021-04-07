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
import 'package:eliud_core/tools/query/query_tools.dart';


const _memberLimit = 5;

class MemberListBloc extends Bloc<MemberListEvent, MemberListState> {
  final MemberRepository _memberRepository;
  StreamSubscription? _membersListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  MemberListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberRepository memberRepository})
      : assert(memberRepository != null),
        _memberRepository = memberRepository,
        super(MemberListLoading());

  Stream<MemberListState> _mapLoadMemberListToState() async* {
    int amountNow =  (state is MemberListLoaded) ? (state as MemberListLoaded).values!.length : 0;
    _membersListSubscription?.cancel();
    _membersListSubscription = _memberRepository.listen(
          (list) => add(MemberListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _memberLimit : null
    );
  }

  Stream<MemberListState> _mapLoadMemberListWithDetailsToState() async* {
    int amountNow =  (state is MemberListLoaded) ? (state as MemberListLoaded).values!.length : 0;
    _membersListSubscription?.cancel();
    _membersListSubscription = _memberRepository.listenWithDetails(
            (list) => add(MemberListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _memberLimit : null
    );
  }

  Stream<MemberListState> _mapAddMemberListToState(AddMemberList event) async* {
    _memberRepository.add(event.value);
  }

  Stream<MemberListState> _mapUpdateMemberListToState(UpdateMemberList event) async* {
    _memberRepository.update(event.value);
  }

  Stream<MemberListState> _mapDeleteMemberListToState(DeleteMemberList event) async* {
    _memberRepository.delete(event.value);
  }

  Stream<MemberListState> _mapMemberListUpdatedToState(
      MemberListUpdated event) async* {
    yield MemberListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<MemberListState> mapEventToState(MemberListEvent event) async* {
    if (event is LoadMemberList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadMemberListToState();
      } else {
        yield* _mapLoadMemberListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


