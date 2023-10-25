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

import 'member_medium_model.dart';

typedef List<MemberMediumModel?> FilterMemberMediumModels(List<MemberMediumModel?> values);



class MemberMediumListBloc extends Bloc<MemberMediumListEvent, MemberMediumListState> {
  final FilterMemberMediumModels? filter;
  final MemberMediumRepository _memberMediumRepository;
  StreamSubscription? _memberMediumsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberMediumLimit;

  MemberMediumListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberMediumRepository memberMediumRepository, this.memberMediumLimit = 5})
      : assert(memberMediumRepository != null),
        _memberMediumRepository = memberMediumRepository,
        super(MemberMediumListLoading()) {
    on <LoadMemberMediumList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberMediumListToState();
      } else {
        _mapLoadMemberMediumListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMemberMediumListWithDetailsToState();
    });
    
    on <MemberMediumChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberMediumListToState();
      } else {
        _mapLoadMemberMediumListWithDetailsToState();
      }
    });
      
    on <AddMemberMediumList> ((event, emit) async {
      await _mapAddMemberMediumListToState(event);
    });
    
    on <UpdateMemberMediumList> ((event, emit) async {
      await _mapUpdateMemberMediumListToState(event);
    });
    
    on <DeleteMemberMediumList> ((event, emit) async {
      await _mapDeleteMemberMediumListToState(event);
    });
    
    on <MemberMediumListUpdated> ((event, emit) {
      emit(_mapMemberMediumListUpdatedToState(event));
    });
  }

  List<MemberMediumModel?> _filter(List<MemberMediumModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMemberMediumListToState() async {
    int amountNow =  (state is MemberMediumListLoaded) ? (state as MemberMediumListLoaded).values!.length : 0;
    _memberMediumsListSubscription?.cancel();
    _memberMediumsListSubscription = _memberMediumRepository.listen(
          (list) => add(MemberMediumListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * memberMediumLimit : null
    );
  }

  Future<void> _mapLoadMemberMediumListWithDetailsToState() async {
    int amountNow =  (state is MemberMediumListLoaded) ? (state as MemberMediumListLoaded).values!.length : 0;
    _memberMediumsListSubscription?.cancel();
    _memberMediumsListSubscription = _memberMediumRepository.listenWithDetails(
            (list) => add(MemberMediumListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberMediumLimit : null
    );
  }

  Future<void> _mapAddMemberMediumListToState(AddMemberMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _memberMediumRepository.add(value);
    }
  }

  Future<void> _mapUpdateMemberMediumListToState(UpdateMemberMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _memberMediumRepository.update(value);
    }
  }

  Future<void> _mapDeleteMemberMediumListToState(DeleteMemberMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _memberMediumRepository.delete(value);
    }
  }

  MemberMediumListLoaded _mapMemberMediumListUpdatedToState(
      MemberMediumListUpdated event) => MemberMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _memberMediumsListSubscription?.cancel();
    return super.close();
  }
}


