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


class MemberSubscriptionListBloc extends Bloc<MemberSubscriptionListEvent, MemberSubscriptionListState> {
  final MemberSubscriptionRepository _memberSubscriptionRepository;
  StreamSubscription _memberSubscriptionsListSubscription;

  MemberSubscriptionListBloc({ @required MemberSubscriptionRepository memberSubscriptionRepository })
      : assert(memberSubscriptionRepository != null),
      _memberSubscriptionRepository = memberSubscriptionRepository,
      super(MemberSubscriptionListLoading());

  Stream<MemberSubscriptionListState> _mapLoadMemberSubscriptionListToState() async* {
    _memberSubscriptionsListSubscription?.cancel();
    _memberSubscriptionsListSubscription = _memberSubscriptionRepository.listen((list) => add(MemberSubscriptionListUpdated(value: list)));
  }

  Stream<MemberSubscriptionListState> _mapLoadMemberSubscriptionListWithDetailsToState() async* {
    _memberSubscriptionsListSubscription?.cancel();
    _memberSubscriptionsListSubscription = _memberSubscriptionRepository.listenWithDetails((list) => add(MemberSubscriptionListUpdated(value: list)));
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

  Stream<MemberSubscriptionListState> _mapMemberSubscriptionListUpdatedToState(MemberSubscriptionListUpdated event) async* {
    yield MemberSubscriptionListLoaded(values: event.value);
  }


  @override
  Stream<MemberSubscriptionListState> mapEventToState(MemberSubscriptionListEvent event) async* {
    final currentState = state;
    if (event is LoadMemberSubscriptionList) {
      yield* _mapLoadMemberSubscriptionListToState();
    } if (event is LoadMemberSubscriptionListWithDetails) {
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


