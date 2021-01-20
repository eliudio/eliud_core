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


const _memberSubscriptionLimit = 5;

class MemberSubscriptionListBloc extends Bloc<MemberSubscriptionListEvent, MemberSubscriptionListState> {
  final MemberSubscriptionRepository _memberSubscriptionRepository;
  StreamSubscription _memberSubscriptionsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  MemberSubscriptionListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required MemberSubscriptionRepository memberSubscriptionRepository})
      : assert(memberSubscriptionRepository != null),
        _memberSubscriptionRepository = memberSubscriptionRepository,
        super(MemberSubscriptionListLoading());

  Stream<MemberSubscriptionListState> _mapLoadMemberSubscriptionListToState() async* {
    int amountNow =  (state is MemberSubscriptionListLoaded) ? (state as MemberSubscriptionListLoaded).values.length : 0;
    _memberSubscriptionsListSubscription?.cancel();
    _memberSubscriptionsListSubscription = _memberSubscriptionRepository.listen(
          (list) => add(MemberSubscriptionListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _memberSubscriptionLimit : null
    );
  }

  Stream<MemberSubscriptionListState> _mapLoadMemberSubscriptionListWithDetailsToState() async* {
    int amountNow =  (state is MemberSubscriptionListLoaded) ? (state as MemberSubscriptionListLoaded).values.length : 0;
    _memberSubscriptionsListSubscription?.cancel();
    _memberSubscriptionsListSubscription = _memberSubscriptionRepository.listenWithDetails(
            (list) => add(MemberSubscriptionListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _memberSubscriptionLimit : null
    );
  }

  Stream<MemberSubscriptionListState> _mapAddMemberSubscriptionListToState(AddMemberSubscriptionList event) async* {
    _memberSubscriptionRepository.add(event.value);
  }

  Stream<MemberSubscriptionListState> _mapUpdateMemberSubscriptionListToState(UpdateMemberSubscriptionList event) async* {
    _memberSubscriptionRepository.update(event.value);
  }

  Stream<MemberSubscriptionListState> _mapDeleteMemberSubscriptionListToState(DeleteMemberSubscriptionList event) async* {
    _memberSubscriptionRepository.delete(event.value);
  }

  Stream<MemberSubscriptionListState> _mapMemberSubscriptionListUpdatedToState(
      MemberSubscriptionListUpdated event) async* {
    yield MemberSubscriptionListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<MemberSubscriptionListState> mapEventToState(MemberSubscriptionListEvent event) async* {
    if (event is LoadMemberSubscriptionList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadMemberSubscriptionListToState();
      } else {
        yield* _mapLoadMemberSubscriptionListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadMemberSubscriptionListWithDetailsToState();
    } else if (event is AddMemberSubscriptionList) {
      yield* _mapAddMemberSubscriptionListToState(event);
    } else if (event is UpdateMemberSubscriptionList) {
      yield* _mapUpdateMemberSubscriptionListToState(event);
    } else if (event is DeleteMemberSubscriptionList) {
      yield* _mapDeleteMemberSubscriptionListToState(event);
    } else if (event is MemberSubscriptionListUpdated) {
      yield* _mapMemberSubscriptionListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _memberSubscriptionsListSubscription?.cancel();
    return super.close();
  }
}


