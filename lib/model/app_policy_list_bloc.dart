/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/app_policy_repository.dart';
import 'package:eliud_core/model/app_policy_list_event.dart';
import 'package:eliud_core/model/app_policy_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _appPolicyLimit = 5;

class AppPolicyListBloc extends Bloc<AppPolicyListEvent, AppPolicyListState> {
  final AppPolicyRepository _appPolicyRepository;
  StreamSubscription? _appPolicysListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  AppPolicyListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AppPolicyRepository appPolicyRepository})
      : assert(appPolicyRepository != null),
        _appPolicyRepository = appPolicyRepository,
        super(AppPolicyListLoading());

  Stream<AppPolicyListState> _mapLoadAppPolicyListToState() async* {
    int amountNow =  (state is AppPolicyListLoaded) ? (state as AppPolicyListLoaded).values!.length : 0;
    _appPolicysListSubscription?.cancel();
    _appPolicysListSubscription = _appPolicyRepository.listen(
          (list) => add(AppPolicyListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _appPolicyLimit : null
    );
  }

  Stream<AppPolicyListState> _mapLoadAppPolicyListWithDetailsToState() async* {
    int amountNow =  (state is AppPolicyListLoaded) ? (state as AppPolicyListLoaded).values!.length : 0;
    _appPolicysListSubscription?.cancel();
    _appPolicysListSubscription = _appPolicyRepository.listenWithDetails(
            (list) => add(AppPolicyListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _appPolicyLimit : null
    );
  }

  Stream<AppPolicyListState> _mapAddAppPolicyListToState(AddAppPolicyList event) async* {
    _appPolicyRepository.add(event.value);
  }

  Stream<AppPolicyListState> _mapUpdateAppPolicyListToState(UpdateAppPolicyList event) async* {
    _appPolicyRepository.update(event.value);
  }

  Stream<AppPolicyListState> _mapDeleteAppPolicyListToState(DeleteAppPolicyList event) async* {
    _appPolicyRepository.delete(event.value);
  }

  Stream<AppPolicyListState> _mapAppPolicyListUpdatedToState(
      AppPolicyListUpdated event) async* {
    yield AppPolicyListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<AppPolicyListState> mapEventToState(AppPolicyListEvent event) async* {
    if (event is LoadAppPolicyList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAppPolicyListToState();
      } else {
        yield* _mapLoadAppPolicyListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadAppPolicyListWithDetailsToState();
    } else if (event is AddAppPolicyList) {
      yield* _mapAddAppPolicyListToState(event);
    } else if (event is UpdateAppPolicyList) {
      yield* _mapUpdateAppPolicyListToState(event);
    } else if (event is DeleteAppPolicyList) {
      yield* _mapDeleteAppPolicyListToState(event);
    } else if (event is AppPolicyListUpdated) {
      yield* _mapAppPolicyListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _appPolicysListSubscription?.cancel();
    return super.close();
  }
}


