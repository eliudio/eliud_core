/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/policy_repository.dart';
import 'package:eliud_core/model/policy_list_event.dart';
import 'package:eliud_core/model/policy_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _policyLimit = 5;

class PolicyListBloc extends Bloc<PolicyListEvent, PolicyListState> {
  final PolicyRepository _policyRepository;
  StreamSubscription _policysListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  PolicyListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required PolicyRepository policyRepository})
      : assert(policyRepository != null),
        _policyRepository = policyRepository,
        super(PolicyListLoading());

  Stream<PolicyListState> _mapLoadPolicyListToState() async* {
    int amountNow =  (state is PolicyListLoaded) ? (state as PolicyListLoaded).values.length : 0;
    _policysListSubscription?.cancel();
    _policysListSubscription = _policyRepository.listen(
          (list) => add(PolicyListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _policyLimit : null
    );
  }

  Stream<PolicyListState> _mapLoadPolicyListWithDetailsToState() async* {
    int amountNow =  (state is PolicyListLoaded) ? (state as PolicyListLoaded).values.length : 0;
    _policysListSubscription?.cancel();
    _policysListSubscription = _policyRepository.listenWithDetails(
            (list) => add(PolicyListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _policyLimit : null
    );
  }

  Stream<PolicyListState> _mapAddPolicyListToState(AddPolicyList event) async* {
    _policyRepository.add(event.value);
  }

  Stream<PolicyListState> _mapUpdatePolicyListToState(UpdatePolicyList event) async* {
    _policyRepository.update(event.value);
  }

  Stream<PolicyListState> _mapDeletePolicyListToState(DeletePolicyList event) async* {
    _policyRepository.delete(event.value);
  }

  Stream<PolicyListState> _mapPolicyListUpdatedToState(
      PolicyListUpdated event) async* {
    yield PolicyListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PolicyListState> mapEventToState(PolicyListEvent event) async* {
    if (event is LoadPolicyList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadPolicyListToState();
      } else {
        yield* _mapLoadPolicyListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPolicyListWithDetailsToState();
    } else if (event is AddPolicyList) {
      yield* _mapAddPolicyListToState(event);
    } else if (event is UpdatePolicyList) {
      yield* _mapUpdatePolicyListToState(event);
    } else if (event is DeletePolicyList) {
      yield* _mapDeletePolicyListToState(event);
    } else if (event is PolicyListUpdated) {
      yield* _mapPolicyListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _policysListSubscription?.cancel();
    return super.close();
  }
}


