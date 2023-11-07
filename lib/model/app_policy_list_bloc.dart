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

import 'package:eliud_core/model/app_policy_repository.dart';
import 'package:eliud_core/model/app_policy_list_event.dart';
import 'package:eliud_core/model/app_policy_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'app_policy_model.dart';

typedef FilterAppPolicyModels = List<AppPolicyModel?> Function(
    List<AppPolicyModel?> values);

class AppPolicyListBloc extends Bloc<AppPolicyListEvent, AppPolicyListState> {
  final FilterAppPolicyModels? filter;
  final AppPolicyRepository _appPolicyRepository;
  StreamSubscription? _appPolicysListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int appPolicyLimit;

  AppPolicyListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required AppPolicyRepository appPolicyRepository,
      this.appPolicyLimit = 5})
      : _appPolicyRepository = appPolicyRepository,
        super(AppPolicyListLoading()) {
    on<LoadAppPolicyList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppPolicyListToState();
      } else {
        _mapLoadAppPolicyListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadAppPolicyListWithDetailsToState();
    });

    on<AppPolicyChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppPolicyListToState();
      } else {
        _mapLoadAppPolicyListWithDetailsToState();
      }
    });

    on<AddAppPolicyList>((event, emit) async {
      await _mapAddAppPolicyListToState(event);
    });

    on<UpdateAppPolicyList>((event, emit) async {
      await _mapUpdateAppPolicyListToState(event);
    });

    on<DeleteAppPolicyList>((event, emit) async {
      await _mapDeleteAppPolicyListToState(event);
    });

    on<AppPolicyListUpdated>((event, emit) {
      emit(_mapAppPolicyListUpdatedToState(event));
    });
  }

  List<AppPolicyModel?> _filter(List<AppPolicyModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadAppPolicyListToState() async {
    int amountNow = (state is AppPolicyListLoaded)
        ? (state as AppPolicyListLoaded).values!.length
        : 0;
    _appPolicysListSubscription?.cancel();
    _appPolicysListSubscription = _appPolicyRepository.listen(
        (list) => add(AppPolicyListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * appPolicyLimit : null);
  }

  Future<void> _mapLoadAppPolicyListWithDetailsToState() async {
    int amountNow = (state is AppPolicyListLoaded)
        ? (state as AppPolicyListLoaded).values!.length
        : 0;
    _appPolicysListSubscription?.cancel();
    _appPolicysListSubscription = _appPolicyRepository.listenWithDetails(
        (list) => add(AppPolicyListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * appPolicyLimit : null);
  }

  Future<void> _mapAddAppPolicyListToState(AddAppPolicyList event) async {
    var value = event.value;
    if (value != null) {
      await _appPolicyRepository.add(value);
    }
  }

  Future<void> _mapUpdateAppPolicyListToState(UpdateAppPolicyList event) async {
    var value = event.value;
    if (value != null) {
      await _appPolicyRepository.update(value);
    }
  }

  Future<void> _mapDeleteAppPolicyListToState(DeleteAppPolicyList event) async {
    var value = event.value;
    if (value != null) {
      await _appPolicyRepository.delete(value);
    }
  }

  AppPolicyListLoaded _mapAppPolicyListUpdatedToState(
          AppPolicyListUpdated event) =>
      AppPolicyListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _appPolicysListSubscription?.cancel();
    return super.close();
  }
}
