/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/app_policy_item_repository.dart';
import 'package:eliud_core/model/app_policy_item_list_event.dart';
import 'package:eliud_core/model/app_policy_item_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _appPolicyItemLimit = 5;

class AppPolicyItemListBloc extends Bloc<AppPolicyItemListEvent, AppPolicyItemListState> {
  final AppPolicyItemRepository _appPolicyItemRepository;
  StreamSubscription _appPolicyItemsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  AppPolicyItemListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required AppPolicyItemRepository appPolicyItemRepository})
      : assert(appPolicyItemRepository != null),
        _appPolicyItemRepository = appPolicyItemRepository,
        super(AppPolicyItemListLoading());

  Stream<AppPolicyItemListState> _mapLoadAppPolicyItemListToState() async* {
    int amountNow =  (state is AppPolicyItemListLoaded) ? (state as AppPolicyItemListLoaded).values.length : 0;
    _appPolicyItemsListSubscription?.cancel();
    _appPolicyItemsListSubscription = _appPolicyItemRepository.listen(
          (list) => add(AppPolicyItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _appPolicyItemLimit : null
    );
  }

  Stream<AppPolicyItemListState> _mapLoadAppPolicyItemListWithDetailsToState() async* {
    int amountNow =  (state is AppPolicyItemListLoaded) ? (state as AppPolicyItemListLoaded).values.length : 0;
    _appPolicyItemsListSubscription?.cancel();
    _appPolicyItemsListSubscription = _appPolicyItemRepository.listenWithDetails(
            (list) => add(AppPolicyItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _appPolicyItemLimit : null
    );
  }

  Stream<AppPolicyItemListState> _mapAddAppPolicyItemListToState(AddAppPolicyItemList event) async* {
    _appPolicyItemRepository.add(event.value);
  }

  Stream<AppPolicyItemListState> _mapUpdateAppPolicyItemListToState(UpdateAppPolicyItemList event) async* {
    _appPolicyItemRepository.update(event.value);
  }

  Stream<AppPolicyItemListState> _mapDeleteAppPolicyItemListToState(DeleteAppPolicyItemList event) async* {
    _appPolicyItemRepository.delete(event.value);
  }

  Stream<AppPolicyItemListState> _mapAppPolicyItemListUpdatedToState(
      AppPolicyItemListUpdated event) async* {
    yield AppPolicyItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<AppPolicyItemListState> mapEventToState(AppPolicyItemListEvent event) async* {
    if (event is LoadAppPolicyItemList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadAppPolicyItemListToState();
      } else {
        yield* _mapLoadAppPolicyItemListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadAppPolicyItemListWithDetailsToState();
    } else if (event is AddAppPolicyItemList) {
      yield* _mapAddAppPolicyItemListToState(event);
    } else if (event is UpdateAppPolicyItemList) {
      yield* _mapUpdateAppPolicyItemListToState(event);
    } else if (event is DeleteAppPolicyItemList) {
      yield* _mapDeleteAppPolicyItemListToState(event);
    } else if (event is AppPolicyItemListUpdated) {
      yield* _mapAppPolicyItemListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _appPolicyItemsListSubscription?.cancel();
    return super.close();
  }
}


