/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/member_medium_container_repository.dart';
import 'package:eliud_core/model/member_medium_container_list_event.dart';
import 'package:eliud_core/model/member_medium_container_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'member_medium_container_model.dart';

typedef List<MemberMediumContainerModel?> FilterMemberMediumContainerModels(List<MemberMediumContainerModel?> values);



class MemberMediumContainerListBloc extends Bloc<MemberMediumContainerListEvent, MemberMediumContainerListState> {
  final FilterMemberMediumContainerModels? filter;
  final MemberMediumContainerRepository _memberMediumContainerRepository;
  StreamSubscription? _memberMediumContainersListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberMediumContainerLimit;

  MemberMediumContainerListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberMediumContainerRepository memberMediumContainerRepository, this.memberMediumContainerLimit = 5})
      : assert(memberMediumContainerRepository != null),
        _memberMediumContainerRepository = memberMediumContainerRepository,
        super(MemberMediumContainerListLoading()) {
    on <LoadMemberMediumContainerList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberMediumContainerListToState();
      } else {
        _mapLoadMemberMediumContainerListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMemberMediumContainerListWithDetailsToState();
    });
    
    on <MemberMediumContainerChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberMediumContainerListToState();
      } else {
        _mapLoadMemberMediumContainerListWithDetailsToState();
      }
    });
      
    on <AddMemberMediumContainerList> ((event, emit) async {
      await _mapAddMemberMediumContainerListToState(event);
    });
    
    on <UpdateMemberMediumContainerList> ((event, emit) async {
      await _mapUpdateMemberMediumContainerListToState(event);
    });
    
    on <DeleteMemberMediumContainerList> ((event, emit) async {
      await _mapDeleteMemberMediumContainerListToState(event);
    });
    
    on <MemberMediumContainerListUpdated> ((event, emit) {
      emit(_mapMemberMediumContainerListUpdatedToState(event));
    });
  }

  List<MemberMediumContainerModel?> _filter(List<MemberMediumContainerModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMemberMediumContainerListToState() async {
    int amountNow =  (state is MemberMediumContainerListLoaded) ? (state as MemberMediumContainerListLoaded).values!.length : 0;
    _memberMediumContainersListSubscription?.cancel();
    _memberMediumContainersListSubscription = _memberMediumContainerRepository.listen(
          (list) => add(MemberMediumContainerListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * memberMediumContainerLimit : null
    );
  }

  Future<void> _mapLoadMemberMediumContainerListWithDetailsToState() async {
    int amountNow =  (state is MemberMediumContainerListLoaded) ? (state as MemberMediumContainerListLoaded).values!.length : 0;
    _memberMediumContainersListSubscription?.cancel();
    _memberMediumContainersListSubscription = _memberMediumContainerRepository.listenWithDetails(
            (list) => add(MemberMediumContainerListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberMediumContainerLimit : null
    );
  }

  Future<void> _mapAddMemberMediumContainerListToState(AddMemberMediumContainerList event) async {
    var value = event.value;
    if (value != null) {
      await _memberMediumContainerRepository.add(value);
    }
  }

  Future<void> _mapUpdateMemberMediumContainerListToState(UpdateMemberMediumContainerList event) async {
    var value = event.value;
    if (value != null) {
      await _memberMediumContainerRepository.update(value);
    }
  }

  Future<void> _mapDeleteMemberMediumContainerListToState(DeleteMemberMediumContainerList event) async {
    var value = event.value;
    if (value != null) {
      await _memberMediumContainerRepository.delete(value);
    }
  }

  MemberMediumContainerListLoaded _mapMemberMediumContainerListUpdatedToState(
      MemberMediumContainerListUpdated event) => MemberMediumContainerListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _memberMediumContainersListSubscription?.cancel();
    return super.close();
  }
}


