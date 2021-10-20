/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/app_list_event.dart';
import 'package:eliud_core/model/app_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class AppListBloc extends Bloc<AppListEvent, AppListState> {
  final AppRepository _appRepository;
  StreamSubscription? _appsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int appLimit;

  AppListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AppRepository appRepository, this.appLimit = 5})
      : assert(appRepository != null),
        _appRepository = appRepository,
        super(AppListLoading());

  Stream<AppListState> _mapLoadAppListToState() async* {
    int amountNow =  (state is AppListLoaded) ? (state as AppListLoaded).values!.length : 0;
    print("AmountNow = " + amountNow.toString());
    _appsListSubscription?.cancel();
    print("Cancel");
    _appsListSubscription = _appRepository.listen(
          (list) {
            print("Items!");
            add(AppListUpdated(value: list, mightHaveMore: amountNow != list.length));
          },
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * appLimit : null
    );
  }

  Stream<AppListState> _mapLoadAppListWithDetailsToState() async* {
    int amountNow =  (state is AppListLoaded) ? (state as AppListLoaded).values!.length : 0;
    print("2AmountNow = " + amountNow.toString());
    _appsListSubscription?.cancel();
    print("Cancel");
    _appsListSubscription = _appRepository.listenWithDetails(
            (list) {
              print("Items!");
              add(AppListUpdated(
                  value: list, mightHaveMore: amountNow != list.length));
            },
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * appLimit : null
    );
  }

  Stream<AppListState> _mapAddAppListToState(AddAppList event) async* {
    var value = event.value;
    if (value != null) 
      _appRepository.add(value);
  }

  Stream<AppListState> _mapUpdateAppListToState(UpdateAppList event) async* {
    var value = event.value;
    if (value != null) 
      _appRepository.update(value);
  }

  Stream<AppListState> _mapDeleteAppListToState(DeleteAppList event) async* {
    var value = event.value;
    if (value != null) 
      _appRepository.delete(value);
  }

  Stream<AppListState> _mapAppListUpdatedToState(
      AppListUpdated event) async* {
    yield AppListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<AppListState> mapEventToState(AppListEvent event) async* {
    if (event is LoadAppList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAppListToState();
      } else {
        yield* _mapLoadAppListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadAppListWithDetailsToState();
    } else if (event is AddAppList) {
      yield* _mapAddAppListToState(event);
    } else if (event is UpdateAppList) {
      yield* _mapUpdateAppListToState(event);
    } else if (event is DeleteAppList) {
      yield* _mapDeleteAppListToState(event);
    } else if (event is AppListUpdated) {
      yield* _mapAppListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _appsListSubscription?.cancel();
    return super.close();
  }
}


