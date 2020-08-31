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


class DrawerListBloc extends Bloc<DrawerListEvent, DrawerListState> {
  final DrawerRepository _drawerRepository;
  StreamSubscription _drawersListSubscription;

  DrawerListBloc({ @required DrawerRepository drawerRepository })
      : assert(drawerRepository != null),
      _drawerRepository = drawerRepository,
      super(DrawerListLoading());

  Stream<DrawerListState> _mapLoadDrawerListToState() async* {
    _drawersListSubscription?.cancel();
    _drawersListSubscription = _drawerRepository.listen((list) => add(DrawerListUpdated(value: list)));
  }

  Stream<DrawerListState> _mapLoadDrawerListWithDetailsToState() async* {
    _drawersListSubscription?.cancel();
    _drawersListSubscription = _drawerRepository.listenWithDetails((list) => add(DrawerListUpdated(value: list)));
  }

  Stream<DrawerListState> _mapAddDrawerListToState(AddDrawerList event) async* {
    _drawerRepository.add(event.value);
  }

  Stream<DrawerListState> _mapUpdateDrawerListToState(UpdateDrawerList event) async* {
    _drawerRepository.update(event.value);
  }

  Stream<DrawerListState> _mapDeleteDrawerListToState(DeleteDrawerList event) async* {
    _drawerRepository.delete(event.value);
  }

  Stream<DrawerListState> _mapDrawerListUpdatedToState(DrawerListUpdated event) async* {
    yield DrawerListLoaded(values: event.value);
  }


  @override
  Stream<DrawerListState> mapEventToState(DrawerListEvent event) async* {
    final currentState = state;
    if (event is LoadDrawerList) {
      yield* _mapLoadDrawerListToState();
    } if (event is LoadDrawerListWithDetails) {
      yield* _mapLoadDrawerListWithDetailsToState();
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


