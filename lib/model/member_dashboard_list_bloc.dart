/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/member_dashboard_repository.dart';
import 'package:eliud_core/model/member_dashboard_list_event.dart';
import 'package:eliud_core/model/member_dashboard_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _memberDashboardLimit = 5;

class MemberDashboardListBloc extends Bloc<MemberDashboardListEvent, MemberDashboardListState> {
  final MemberDashboardRepository _memberDashboardRepository;
  StreamSubscription _memberDashboardsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  MemberDashboardListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required MemberDashboardRepository memberDashboardRepository})
      : assert(memberDashboardRepository != null),
        _memberDashboardRepository = memberDashboardRepository,
        super(MemberDashboardListLoading());

  Stream<MemberDashboardListState> _mapLoadMemberDashboardListToState() async* {
    int amountNow =  (state is MemberDashboardListLoaded) ? (state as MemberDashboardListLoaded).values.length : 0;
    _memberDashboardsListSubscription?.cancel();
    _memberDashboardsListSubscription = _memberDashboardRepository.listen(
          (list) => add(MemberDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _memberDashboardLimit : null
    );
  }

  Stream<MemberDashboardListState> _mapLoadMemberDashboardListWithDetailsToState() async* {
    int amountNow =  (state is MemberDashboardListLoaded) ? (state as MemberDashboardListLoaded).values.length : 0;
    _memberDashboardsListSubscription?.cancel();
    _memberDashboardsListSubscription = _memberDashboardRepository.listenWithDetails(
            (list) => add(MemberDashboardListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _memberDashboardLimit : null
    );
  }

  Stream<MemberDashboardListState> _mapAddMemberDashboardListToState(AddMemberDashboardList event) async* {
    _memberDashboardRepository.add(event.value);
  }

  Stream<MemberDashboardListState> _mapUpdateMemberDashboardListToState(UpdateMemberDashboardList event) async* {
    _memberDashboardRepository.update(event.value);
  }

  Stream<MemberDashboardListState> _mapDeleteMemberDashboardListToState(DeleteMemberDashboardList event) async* {
    _memberDashboardRepository.delete(event.value);
  }

  Stream<MemberDashboardListState> _mapMemberDashboardListUpdatedToState(
      MemberDashboardListUpdated event) async* {
    yield MemberDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<MemberDashboardListState> mapEventToState(MemberDashboardListEvent event) async* {
    if (event is LoadMemberDashboardList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadMemberDashboardListToState();
      } else {
        yield* _mapLoadMemberDashboardListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadMemberDashboardListWithDetailsToState();
    } else if (event is AddMemberDashboardList) {
      yield* _mapAddMemberDashboardListToState(event);
    } else if (event is UpdateMemberDashboardList) {
      yield* _mapUpdateMemberDashboardListToState(event);
    } else if (event is DeleteMemberDashboardList) {
      yield* _mapDeleteMemberDashboardListToState(event);
    } else if (event is MemberDashboardListUpdated) {
      yield* _mapMemberDashboardListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _memberDashboardsListSubscription?.cancel();
    return super.close();
  }
}


