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

import 'member_dashboard_model.dart';

typedef List<MemberDashboardModel?> FilterMemberDashboardModels(List<MemberDashboardModel?> values);



class MemberDashboardListBloc extends Bloc<MemberDashboardListEvent, MemberDashboardListState> {
  final FilterMemberDashboardModels? filter;
  final MemberDashboardRepository _memberDashboardRepository;
  StreamSubscription? _memberDashboardsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberDashboardLimit;

  MemberDashboardListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberDashboardRepository memberDashboardRepository, this.memberDashboardLimit = 5})
      : assert(memberDashboardRepository != null),
        _memberDashboardRepository = memberDashboardRepository,
        super(MemberDashboardListLoading()) {
    on <LoadMemberDashboardList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberDashboardListToState();
      } else {
        _mapLoadMemberDashboardListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMemberDashboardListWithDetailsToState();
    });
    
    on <MemberDashboardChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberDashboardListToState();
      } else {
        _mapLoadMemberDashboardListWithDetailsToState();
      }
    });
      
    on <AddMemberDashboardList> ((event, emit) async {
      await _mapAddMemberDashboardListToState(event);
    });
    
    on <UpdateMemberDashboardList> ((event, emit) async {
      await _mapUpdateMemberDashboardListToState(event);
    });
    
    on <DeleteMemberDashboardList> ((event, emit) async {
      await _mapDeleteMemberDashboardListToState(event);
    });
    
    on <MemberDashboardListUpdated> ((event, emit) {
      emit(_mapMemberDashboardListUpdatedToState(event));
    });
  }

  List<MemberDashboardModel?> _filter(List<MemberDashboardModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMemberDashboardListToState() async {
    int amountNow =  (state is MemberDashboardListLoaded) ? (state as MemberDashboardListLoaded).values!.length : 0;
    _memberDashboardsListSubscription?.cancel();
    _memberDashboardsListSubscription = _memberDashboardRepository.listen(
          (list) => add(MemberDashboardListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * memberDashboardLimit : null
    );
  }

  Future<void> _mapLoadMemberDashboardListWithDetailsToState() async {
    int amountNow =  (state is MemberDashboardListLoaded) ? (state as MemberDashboardListLoaded).values!.length : 0;
    _memberDashboardsListSubscription?.cancel();
    _memberDashboardsListSubscription = _memberDashboardRepository.listenWithDetails(
            (list) => add(MemberDashboardListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberDashboardLimit : null
    );
  }

  Future<void> _mapAddMemberDashboardListToState(AddMemberDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _memberDashboardRepository.add(value);
    }
  }

  Future<void> _mapUpdateMemberDashboardListToState(UpdateMemberDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _memberDashboardRepository.update(value);
    }
  }

  Future<void> _mapDeleteMemberDashboardListToState(DeleteMemberDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _memberDashboardRepository.delete(value);
    }
  }

  MemberDashboardListLoaded _mapMemberDashboardListUpdatedToState(
      MemberDashboardListUpdated event) => MemberDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _memberDashboardsListSubscription?.cancel();
    return super.close();
  }
}


