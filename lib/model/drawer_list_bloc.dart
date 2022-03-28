/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/drawer_repository.dart';
import 'package:eliud_core/model/drawer_list_event.dart';
import 'package:eliud_core/model/drawer_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class DrawerListBloc extends Bloc<DrawerListEvent, DrawerListState> {
  final DrawerRepository _drawerRepository;
  StreamSubscription? _drawersListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int drawerLimit;

  DrawerListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DrawerRepository drawerRepository, this.drawerLimit = 5})
      : assert(drawerRepository != null),
        _drawerRepository = drawerRepository,
        super(DrawerListLoading());

  Stream<DrawerListState> _mapLoadDrawerListToState() async* {
    int amountNow =  (state is DrawerListLoaded) ? (state as DrawerListLoaded).values!.length : 0;
    _drawersListSubscription?.cancel();
    _drawersListSubscription = _drawerRepository.listen(
          (list) => add(DrawerListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * drawerLimit : null
    );
  }

  Stream<DrawerListState> _mapLoadDrawerListWithDetailsToState() async* {
    int amountNow =  (state is DrawerListLoaded) ? (state as DrawerListLoaded).values!.length : 0;
    _drawersListSubscription?.cancel();
    _drawersListSubscription = _drawerRepository.listenWithDetails(
            (list) => add(DrawerListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * drawerLimit : null
    );
  }

  Stream<DrawerListState> _mapAddDrawerListToState(AddDrawerList event) async* {
    var value = event.value;
    if (value != null) 
      _drawerRepository.add(value);
  }

  Stream<DrawerListState> _mapUpdateDrawerListToState(UpdateDrawerList event) async* {
    var value = event.value;
    if (value != null) 
      _drawerRepository.update(value);
  }

  Stream<DrawerListState> _mapDeleteDrawerListToState(DeleteDrawerList event) async* {
    var value = event.value;
    if (value != null) 
      _drawerRepository.delete(value);
  }

  Stream<DrawerListState> _mapDrawerListUpdatedToState(
      DrawerListUpdated event) async* {
    yield DrawerListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<DrawerListState> mapEventToState(DrawerListEvent event) async* {
    if (event is LoadDrawerList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDrawerListToState();
      } else {
        yield* _mapLoadDrawerListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadDrawerListWithDetailsToState();
    } else if (event is DrawerChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDrawerListToState();
      } else {
        yield* _mapLoadDrawerListWithDetailsToState();
      }
    } else if (event is AddDrawerList) {
      yield* _mapAddDrawerListToState(event);
    } else if (event is UpdateDrawerList) {
      yield* _mapUpdateDrawerListToState(event);
    } else if (event is DeleteDrawerList) {
      yield* _mapDeleteDrawerListToState(event);
    } else if (event is DrawerListUpdated) {
      yield* _mapDrawerListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _drawersListSubscription?.cancel();
    return super.close();
  }
}


