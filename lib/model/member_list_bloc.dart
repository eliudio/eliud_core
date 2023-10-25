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

import 'member_model.dart';

typedef List<MemberModel?> FilterMemberModels(List<MemberModel?> values);



class MemberListBloc extends Bloc<MemberListEvent, MemberListState> {
  final FilterMemberModels? filter;
  final MemberRepository _memberRepository;
  StreamSubscription? _membersListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberLimit;

  MemberListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberRepository memberRepository, this.memberLimit = 5})
      : assert(memberRepository != null),
        _memberRepository = memberRepository,
        super(MemberListLoading()) {
    on <LoadMemberList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberListToState();
      } else {
        _mapLoadMemberListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMemberListWithDetailsToState();
    });
    
    on <MemberChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberListToState();
      } else {
        _mapLoadMemberListWithDetailsToState();
      }
    });
      
    on <AddMemberList> ((event, emit) async {
      await _mapAddMemberListToState(event);
    });
    
    on <UpdateMemberList> ((event, emit) async {
      await _mapUpdateMemberListToState(event);
    });
    
    on <DeleteMemberList> ((event, emit) async {
      await _mapDeleteMemberListToState(event);
    });
    
    on <MemberListUpdated> ((event, emit) {
      emit(_mapMemberListUpdatedToState(event));
    });
  }

  List<MemberModel?> _filter(List<MemberModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMemberListToState() async {
    int amountNow =  (state is MemberListLoaded) ? (state as MemberListLoaded).values!.length : 0;
    _membersListSubscription?.cancel();
    _membersListSubscription = _memberRepository.listen(
          (list) => add(MemberListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * memberLimit : null
    );
  }

  Future<void> _mapLoadMemberListWithDetailsToState() async {
    int amountNow =  (state is MemberListLoaded) ? (state as MemberListLoaded).values!.length : 0;
    _membersListSubscription?.cancel();
    _membersListSubscription = _memberRepository.listenWithDetails(
            (list) => add(MemberListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberLimit : null
    );
  }

  Future<void> _mapAddMemberListToState(AddMemberList event) async {
    var value = event.value;
    if (value != null) {
      await _memberRepository.add(value);
    }
  }

  Future<void> _mapUpdateMemberListToState(UpdateMemberList event) async {
    var value = event.value;
    if (value != null) {
      await _memberRepository.update(value);
    }
  }

  Future<void> _mapDeleteMemberListToState(DeleteMemberList event) async {
    var value = event.value;
    if (value != null) {
      await _memberRepository.delete(value);
    }
  }

  MemberListLoaded _mapMemberListUpdatedToState(
      MemberListUpdated event) => MemberListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _membersListSubscription?.cancel();
    return super.close();
  }
}


