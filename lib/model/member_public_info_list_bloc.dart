/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/member_public_info_repository.dart';
import 'package:eliud_core/model/member_public_info_list_event.dart';
import 'package:eliud_core/model/member_public_info_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'member_public_info_model.dart';

typedef List<MemberPublicInfoModel?> FilterMemberPublicInfoModels(List<MemberPublicInfoModel?> values);



class MemberPublicInfoListBloc extends Bloc<MemberPublicInfoListEvent, MemberPublicInfoListState> {
  final FilterMemberPublicInfoModels? filter;
  final MemberPublicInfoRepository _memberPublicInfoRepository;
  StreamSubscription? _memberPublicInfosListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberPublicInfoLimit;

  MemberPublicInfoListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberPublicInfoRepository memberPublicInfoRepository, this.memberPublicInfoLimit = 5})
      : assert(memberPublicInfoRepository != null),
        _memberPublicInfoRepository = memberPublicInfoRepository,
        super(MemberPublicInfoListLoading()) {
    on <LoadMemberPublicInfoList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberPublicInfoListToState();
      } else {
        _mapLoadMemberPublicInfoListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMemberPublicInfoListWithDetailsToState();
    });
    
    on <MemberPublicInfoChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberPublicInfoListToState();
      } else {
        _mapLoadMemberPublicInfoListWithDetailsToState();
      }
    });
      
    on <AddMemberPublicInfoList> ((event, emit) async {
      await _mapAddMemberPublicInfoListToState(event);
    });
    
    on <UpdateMemberPublicInfoList> ((event, emit) async {
      await _mapUpdateMemberPublicInfoListToState(event);
    });
    
    on <DeleteMemberPublicInfoList> ((event, emit) async {
      await _mapDeleteMemberPublicInfoListToState(event);
    });
    
    on <MemberPublicInfoListUpdated> ((event, emit) {
      emit(_mapMemberPublicInfoListUpdatedToState(event));
    });
  }

  List<MemberPublicInfoModel?> _filter(List<MemberPublicInfoModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMemberPublicInfoListToState() async {
    int amountNow =  (state is MemberPublicInfoListLoaded) ? (state as MemberPublicInfoListLoaded).values!.length : 0;
    _memberPublicInfosListSubscription?.cancel();
    _memberPublicInfosListSubscription = _memberPublicInfoRepository.listen(
          (list) => add(MemberPublicInfoListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * memberPublicInfoLimit : null
    );
  }

  Future<void> _mapLoadMemberPublicInfoListWithDetailsToState() async {
    int amountNow =  (state is MemberPublicInfoListLoaded) ? (state as MemberPublicInfoListLoaded).values!.length : 0;
    _memberPublicInfosListSubscription?.cancel();
    _memberPublicInfosListSubscription = _memberPublicInfoRepository.listenWithDetails(
            (list) => add(MemberPublicInfoListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberPublicInfoLimit : null
    );
  }

  Future<void> _mapAddMemberPublicInfoListToState(AddMemberPublicInfoList event) async {
    var value = event.value;
    if (value != null) {
      await _memberPublicInfoRepository.add(value);
    }
  }

  Future<void> _mapUpdateMemberPublicInfoListToState(UpdateMemberPublicInfoList event) async {
    var value = event.value;
    if (value != null) {
      await _memberPublicInfoRepository.update(value);
    }
  }

  Future<void> _mapDeleteMemberPublicInfoListToState(DeleteMemberPublicInfoList event) async {
    var value = event.value;
    if (value != null) {
      await _memberPublicInfoRepository.delete(value);
    }
  }

  MemberPublicInfoListLoaded _mapMemberPublicInfoListUpdatedToState(
      MemberPublicInfoListUpdated event) => MemberPublicInfoListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _memberPublicInfosListSubscription?.cancel();
    return super.close();
  }
}


