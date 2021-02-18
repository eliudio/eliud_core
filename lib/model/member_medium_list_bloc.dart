/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/member_medium_repository.dart';
import 'package:eliud_core/model/member_medium_list_event.dart';
import 'package:eliud_core/model/member_medium_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _memberMediumLimit = 5;

class MemberMediumListBloc extends Bloc<MemberMediumListEvent, MemberMediumListState> {
  final MemberMediumRepository _memberMediumRepository;
  StreamSubscription _memberMediumsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  MemberMediumListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required MemberMediumRepository memberMediumRepository})
      : assert(memberMediumRepository != null),
        _memberMediumRepository = memberMediumRepository,
        super(MemberMediumListLoading());

  Stream<MemberMediumListState> _mapLoadMemberMediumListToState() async* {
    int amountNow =  (state is MemberMediumListLoaded) ? (state as MemberMediumListLoaded).values.length : 0;
    _memberMediumsListSubscription?.cancel();
    _memberMediumsListSubscription = _memberMediumRepository.listen(
          (list) => add(MemberMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _memberMediumLimit : null
    );
  }

  Stream<MemberMediumListState> _mapLoadMemberMediumListWithDetailsToState() async* {
    int amountNow =  (state is MemberMediumListLoaded) ? (state as MemberMediumListLoaded).values.length : 0;
    _memberMediumsListSubscription?.cancel();
    _memberMediumsListSubscription = _memberMediumRepository.listenWithDetails(
            (list) => add(MemberMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _memberMediumLimit : null
    );
  }

  Stream<MemberMediumListState> _mapAddMemberMediumListToState(AddMemberMediumList event) async* {
    _memberMediumRepository.add(event.value);
  }

  Stream<MemberMediumListState> _mapUpdateMemberMediumListToState(UpdateMemberMediumList event) async* {
    _memberMediumRepository.update(event.value);
  }

  Stream<MemberMediumListState> _mapDeleteMemberMediumListToState(DeleteMemberMediumList event) async* {
    _memberMediumRepository.delete(event.value);
  }

  Stream<MemberMediumListState> _mapMemberMediumListUpdatedToState(
      MemberMediumListUpdated event) async* {
    yield MemberMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<MemberMediumListState> mapEventToState(MemberMediumListEvent event) async* {
    if (event is LoadMemberMediumList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadMemberMediumListToState();
      } else {
        yield* _mapLoadMemberMediumListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadMemberMediumListWithDetailsToState();
    } else if (event is AddMemberMediumList) {
      yield* _mapAddMemberMediumListToState(event);
    } else if (event is UpdateMemberMediumList) {
      yield* _mapUpdateMemberMediumListToState(event);
    } else if (event is DeleteMemberMediumList) {
      yield* _mapDeleteMemberMediumListToState(event);
    } else if (event is MemberMediumListUpdated) {
      yield* _mapMemberMediumListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _memberMediumsListSubscription?.cancel();
    return super.close();
  }
}


