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



class MemberMediumContainerListBloc extends Bloc<MemberMediumContainerListEvent, MemberMediumContainerListState> {
  final MemberMediumContainerRepository _memberMediumContainerRepository;
  StreamSubscription? _memberMediumContainersListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberMediumContainerLimit;

  MemberMediumContainerListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberMediumContainerRepository memberMediumContainerRepository, this.memberMediumContainerLimit = 5})
      : assert(memberMediumContainerRepository != null),
        _memberMediumContainerRepository = memberMediumContainerRepository,
        super(MemberMediumContainerListLoading());

  Stream<MemberMediumContainerListState> _mapLoadMemberMediumContainerListToState() async* {
    int amountNow =  (state is MemberMediumContainerListLoaded) ? (state as MemberMediumContainerListLoaded).values!.length : 0;
    _memberMediumContainersListSubscription?.cancel();
    _memberMediumContainersListSubscription = _memberMediumContainerRepository.listen(
          (list) => add(MemberMediumContainerListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * memberMediumContainerLimit : null
    );
  }

  Stream<MemberMediumContainerListState> _mapLoadMemberMediumContainerListWithDetailsToState() async* {
    int amountNow =  (state is MemberMediumContainerListLoaded) ? (state as MemberMediumContainerListLoaded).values!.length : 0;
    _memberMediumContainersListSubscription?.cancel();
    _memberMediumContainersListSubscription = _memberMediumContainerRepository.listenWithDetails(
            (list) => add(MemberMediumContainerListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberMediumContainerLimit : null
    );
  }

  Stream<MemberMediumContainerListState> _mapAddMemberMediumContainerListToState(AddMemberMediumContainerList event) async* {
    var value = event.value;
    if (value != null) 
      _memberMediumContainerRepository.add(value);
  }

  Stream<MemberMediumContainerListState> _mapUpdateMemberMediumContainerListToState(UpdateMemberMediumContainerList event) async* {
    var value = event.value;
    if (value != null) 
      _memberMediumContainerRepository.update(value);
  }

  Stream<MemberMediumContainerListState> _mapDeleteMemberMediumContainerListToState(DeleteMemberMediumContainerList event) async* {
    var value = event.value;
    if (value != null) 
      _memberMediumContainerRepository.delete(value);
  }

  Stream<MemberMediumContainerListState> _mapMemberMediumContainerListUpdatedToState(
      MemberMediumContainerListUpdated event) async* {
    yield MemberMediumContainerListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<MemberMediumContainerListState> mapEventToState(MemberMediumContainerListEvent event) async* {
    if (event is LoadMemberMediumContainerList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadMemberMediumContainerListToState();
      } else {
        yield* _mapLoadMemberMediumContainerListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadMemberMediumContainerListWithDetailsToState();
    } else if (event is AddMemberMediumContainerList) {
      yield* _mapAddMemberMediumContainerListToState(event);
    } else if (event is UpdateMemberMediumContainerList) {
      yield* _mapUpdateMemberMediumContainerListToState(event);
    } else if (event is DeleteMemberMediumContainerList) {
      yield* _mapDeleteMemberMediumContainerListToState(event);
    } else if (event is MemberMediumContainerListUpdated) {
      yield* _mapMemberMediumContainerListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _memberMediumContainersListSubscription?.cancel();
    return super.close();
  }
}


