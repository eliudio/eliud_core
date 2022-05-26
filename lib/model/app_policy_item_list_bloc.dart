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
import 'package:eliud_core/model/app_policy_item_list_event.dart';
import 'package:eliud_core/model/app_policy_item_list_state.dart';
import 'package:eliud_core/model/app_policy_item_repository.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class AppPolicyItemListBloc extends Bloc<AppPolicyItemListEvent, AppPolicyItemListState> {
  final AppPolicyItemRepository _appPolicyItemRepository;
  StreamSubscription? _appPolicyItemsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int appPolicyItemLimit;

  AppPolicyItemListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AppPolicyItemRepository appPolicyItemRepository, this.appPolicyItemLimit = 5})
      : assert(appPolicyItemRepository != null),
        _appPolicyItemRepository = appPolicyItemRepository,
        super(AppPolicyItemListLoading()) {
    on <LoadAppPolicyItemList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppPolicyItemListToState();
      } else {
        _mapLoadAppPolicyItemListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadAppPolicyItemListWithDetailsToState();
    });
    
    on <AppPolicyItemChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppPolicyItemListToState();
      } else {
        _mapLoadAppPolicyItemListWithDetailsToState();
      }
    });
      
    on <AddAppPolicyItemList> ((event, emit) async {
      await _mapAddAppPolicyItemListToState(event);
    });
    
    on <UpdateAppPolicyItemList> ((event, emit) async {
      await _mapUpdateAppPolicyItemListToState(event);
    });
    
    on <DeleteAppPolicyItemList> ((event, emit) async {
      await _mapDeleteAppPolicyItemListToState(event);
    });
    
    on <AppPolicyItemListUpdated> ((event, emit) {
      emit(_mapAppPolicyItemListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadAppPolicyItemListToState() async {
    int amountNow =  (state is AppPolicyItemListLoaded) ? (state as AppPolicyItemListLoaded).values!.length : 0;
    _appPolicyItemsListSubscription?.cancel();
    _appPolicyItemsListSubscription = _appPolicyItemRepository.listen(
          (list) => add(AppPolicyItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * appPolicyItemLimit : null
    );
  }

  Future<void> _mapLoadAppPolicyItemListWithDetailsToState() async {
    int amountNow =  (state is AppPolicyItemListLoaded) ? (state as AppPolicyItemListLoaded).values!.length : 0;
    _appPolicyItemsListSubscription?.cancel();
    _appPolicyItemsListSubscription = _appPolicyItemRepository.listenWithDetails(
            (list) => add(AppPolicyItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * appPolicyItemLimit : null
    );
  }

  Future<void> _mapAddAppPolicyItemListToState(AddAppPolicyItemList event) async {
    var value = event.value;
    if (value != null) {
      await _appPolicyItemRepository.add(value);
    }
  }

  Future<void> _mapUpdateAppPolicyItemListToState(UpdateAppPolicyItemList event) async {
    var value = event.value;
    if (value != null) {
      await _appPolicyItemRepository.update(value);
    }
  }

  Future<void> _mapDeleteAppPolicyItemListToState(DeleteAppPolicyItemList event) async {
    var value = event.value;
    if (value != null) {
      await _appPolicyItemRepository.delete(value);
    }
  }

  AppPolicyItemListLoaded _mapAppPolicyItemListUpdatedToState(
      AppPolicyItemListUpdated event) => AppPolicyItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _appPolicyItemsListSubscription?.cancel();
    return super.close();
  }
}


