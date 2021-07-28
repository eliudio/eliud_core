/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/app_entry_pages_repository.dart';
import 'package:eliud_core/model/app_entry_pages_list_event.dart';
import 'package:eliud_core/model/app_entry_pages_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class AppEntryPagesListBloc extends Bloc<AppEntryPagesListEvent, AppEntryPagesListState> {
  final AppEntryPagesRepository _appEntryPagesRepository;
  StreamSubscription? _appEntryPagessListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int appEntryPagesLimit;

  AppEntryPagesListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AppEntryPagesRepository appEntryPagesRepository, this.appEntryPagesLimit = 5})
      : assert(appEntryPagesRepository != null),
        _appEntryPagesRepository = appEntryPagesRepository,
        super(AppEntryPagesListLoading());

  Stream<AppEntryPagesListState> _mapLoadAppEntryPagesListToState() async* {
    int amountNow =  (state is AppEntryPagesListLoaded) ? (state as AppEntryPagesListLoaded).values!.length : 0;
    _appEntryPagessListSubscription?.cancel();
    _appEntryPagessListSubscription = _appEntryPagesRepository.listen(
          (list) => add(AppEntryPagesListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * appEntryPagesLimit : null
    );
  }

  Stream<AppEntryPagesListState> _mapLoadAppEntryPagesListWithDetailsToState() async* {
    int amountNow =  (state is AppEntryPagesListLoaded) ? (state as AppEntryPagesListLoaded).values!.length : 0;
    _appEntryPagessListSubscription?.cancel();
    _appEntryPagessListSubscription = _appEntryPagesRepository.listenWithDetails(
            (list) => add(AppEntryPagesListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * appEntryPagesLimit : null
    );
  }

  Stream<AppEntryPagesListState> _mapAddAppEntryPagesListToState(AddAppEntryPagesList event) async* {
    var value = event.value;
    if (value != null) 
      _appEntryPagesRepository.add(value);
  }

  Stream<AppEntryPagesListState> _mapUpdateAppEntryPagesListToState(UpdateAppEntryPagesList event) async* {
    var value = event.value;
    if (value != null) 
      _appEntryPagesRepository.update(value);
  }

  Stream<AppEntryPagesListState> _mapDeleteAppEntryPagesListToState(DeleteAppEntryPagesList event) async* {
    var value = event.value;
    if (value != null) 
      _appEntryPagesRepository.delete(value);
  }

  Stream<AppEntryPagesListState> _mapAppEntryPagesListUpdatedToState(
      AppEntryPagesListUpdated event) async* {
    yield AppEntryPagesListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<AppEntryPagesListState> mapEventToState(AppEntryPagesListEvent event) async* {
    if (event is LoadAppEntryPagesList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAppEntryPagesListToState();
      } else {
        yield* _mapLoadAppEntryPagesListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadAppEntryPagesListWithDetailsToState();
    } else if (event is AddAppEntryPagesList) {
      yield* _mapAddAppEntryPagesListToState(event);
    } else if (event is UpdateAppEntryPagesList) {
      yield* _mapUpdateAppEntryPagesListToState(event);
    } else if (event is DeleteAppEntryPagesList) {
      yield* _mapDeleteAppEntryPagesListToState(event);
    } else if (event is AppEntryPagesListUpdated) {
      yield* _mapAppEntryPagesListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _appEntryPagessListSubscription?.cancel();
    return super.close();
  }
}


