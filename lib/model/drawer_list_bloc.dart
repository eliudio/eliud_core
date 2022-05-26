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
import 'package:eliud_core/model/drawer_list_event.dart';
import 'package:eliud_core/model/drawer_list_state.dart';
import 'package:eliud_core/model/drawer_repository.dart';
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
        super(DrawerListLoading()) {
    on <LoadDrawerList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDrawerListToState();
      } else {
        _mapLoadDrawerListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadDrawerListWithDetailsToState();
    });
    
    on <DrawerChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDrawerListToState();
      } else {
        _mapLoadDrawerListWithDetailsToState();
      }
    });
      
    on <AddDrawerList> ((event, emit) async {
      await _mapAddDrawerListToState(event);
    });
    
    on <UpdateDrawerList> ((event, emit) async {
      await _mapUpdateDrawerListToState(event);
    });
    
    on <DeleteDrawerList> ((event, emit) async {
      await _mapDeleteDrawerListToState(event);
    });
    
    on <DrawerListUpdated> ((event, emit) {
      emit(_mapDrawerListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadDrawerListToState() async {
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

  Future<void> _mapLoadDrawerListWithDetailsToState() async {
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

  Future<void> _mapAddDrawerListToState(AddDrawerList event) async {
    var value = event.value;
    if (value != null) {
      await _drawerRepository.add(value);
    }
  }

  Future<void> _mapUpdateDrawerListToState(UpdateDrawerList event) async {
    var value = event.value;
    if (value != null) {
      await _drawerRepository.update(value);
    }
  }

  Future<void> _mapDeleteDrawerListToState(DeleteDrawerList event) async {
    var value = event.value;
    if (value != null) {
      await _drawerRepository.delete(value);
    }
  }

  DrawerListLoaded _mapDrawerListUpdatedToState(
      DrawerListUpdated event) => DrawerListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _drawersListSubscription?.cancel();
    return super.close();
  }
}


