/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/member_subscription_repository.dart';
import 'package:eliud_core/model/member_subscription_list_event.dart';
import 'package:eliud_core/model/member_subscription_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'member_subscription_model.dart';

typedef List<MemberSubscriptionModel?> FilterMemberSubscriptionModels(List<MemberSubscriptionModel?> values);



class MemberSubscriptionListBloc extends Bloc<MemberSubscriptionListEvent, MemberSubscriptionListState> {
  final FilterMemberSubscriptionModels? filter;
  final MemberSubscriptionRepository _memberSubscriptionRepository;
  StreamSubscription? _memberSubscriptionsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberSubscriptionLimit;

  MemberSubscriptionListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberSubscriptionRepository memberSubscriptionRepository, this.memberSubscriptionLimit = 5})
      : assert(memberSubscriptionRepository != null),
        _memberSubscriptionRepository = memberSubscriptionRepository,
        super(MemberSubscriptionListLoading()) {
    on <LoadMemberSubscriptionList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberSubscriptionListToState();
      } else {
        _mapLoadMemberSubscriptionListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMemberSubscriptionListWithDetailsToState();
    });
    
    on <MemberSubscriptionChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberSubscriptionListToState();
      } else {
        _mapLoadMemberSubscriptionListWithDetailsToState();
      }
    });
      
    on <AddMemberSubscriptionList> ((event, emit) async {
      await _mapAddMemberSubscriptionListToState(event);
    });
    
    on <UpdateMemberSubscriptionList> ((event, emit) async {
      await _mapUpdateMemberSubscriptionListToState(event);
    });
    
    on <DeleteMemberSubscriptionList> ((event, emit) async {
      await _mapDeleteMemberSubscriptionListToState(event);
    });
    
    on <MemberSubscriptionListUpdated> ((event, emit) {
      emit(_mapMemberSubscriptionListUpdatedToState(event));
    });
  }

  List<MemberSubscriptionModel?> _filter(List<MemberSubscriptionModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMemberSubscriptionListToState() async {
    int amountNow =  (state is MemberSubscriptionListLoaded) ? (state as MemberSubscriptionListLoaded).values!.length : 0;
    _memberSubscriptionsListSubscription?.cancel();
    _memberSubscriptionsListSubscription = _memberSubscriptionRepository.listen(
          (list) => add(MemberSubscriptionListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * memberSubscriptionLimit : null
    );
  }

  Future<void> _mapLoadMemberSubscriptionListWithDetailsToState() async {
    int amountNow =  (state is MemberSubscriptionListLoaded) ? (state as MemberSubscriptionListLoaded).values!.length : 0;
    _memberSubscriptionsListSubscription?.cancel();
    _memberSubscriptionsListSubscription = _memberSubscriptionRepository.listenWithDetails(
            (list) => add(MemberSubscriptionListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberSubscriptionLimit : null
    );
  }

  Future<void> _mapAddMemberSubscriptionListToState(AddMemberSubscriptionList event) async {
    var value = event.value;
    if (value != null) {
      await _memberSubscriptionRepository.add(value);
    }
  }

  Future<void> _mapUpdateMemberSubscriptionListToState(UpdateMemberSubscriptionList event) async {
    var value = event.value;
    if (value != null) {
      await _memberSubscriptionRepository.update(value);
    }
  }

  Future<void> _mapDeleteMemberSubscriptionListToState(DeleteMemberSubscriptionList event) async {
    var value = event.value;
    if (value != null) {
      await _memberSubscriptionRepository.delete(value);
    }
  }

  MemberSubscriptionListLoaded _mapMemberSubscriptionListUpdatedToState(
      MemberSubscriptionListUpdated event) => MemberSubscriptionListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _memberSubscriptionsListSubscription?.cancel();
    return super.close();
  }
}


