/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/menu_def_repository.dart';
import 'package:eliud_core/model/menu_def_list_event.dart';
import 'package:eliud_core/model/menu_def_list_state.dart';


class MenuDefListBloc extends Bloc<MenuDefListEvent, MenuDefListState> {
  final MenuDefRepository _menuDefRepository;
  StreamSubscription _menuDefsListSubscription;

  MenuDefListBloc({ @required MenuDefRepository menuDefRepository })
      : assert(menuDefRepository != null),
      _menuDefRepository = menuDefRepository,
      super(MenuDefListLoading());

  Stream<MenuDefListState> _mapLoadMenuDefListToState() async* {
    _menuDefsListSubscription?.cancel();
    _menuDefsListSubscription = _menuDefRepository.listen((list) => add(MenuDefListUpdated(value: list)));
  }

  Stream<MenuDefListState> _mapLoadMenuDefListWithDetailsToState() async* {
    _menuDefsListSubscription?.cancel();
    _menuDefsListSubscription = _menuDefRepository.listenWithDetails((list) => add(MenuDefListUpdated(value: list)));
  }

  Stream<MenuDefListState> _mapAddMenuDefListToState(AddMenuDefList event) async* {
    _menuDefRepository.add(event.value);
  }

  Stream<MenuDefListState> _mapUpdateMenuDefListToState(UpdateMenuDefList event) async* {
    _menuDefRepository.update(event.value);
  }

  Stream<MenuDefListState> _mapDeleteMenuDefListToState(DeleteMenuDefList event) async* {
    _menuDefRepository.delete(event.value);
  }

  Stream<MenuDefListState> _mapMenuDefListUpdatedToState(MenuDefListUpdated event) async* {
    yield MenuDefListLoaded(values: event.value);
  }


  @override
  Stream<MenuDefListState> mapEventToState(MenuDefListEvent event) async* {
    final currentState = state;
    if (event is LoadMenuDefList) {
      yield* _mapLoadMenuDefListToState();
    } if (event is LoadMenuDefListWithDetails) {
      yield* _mapLoadMenuDefListWithDetailsToState();
    } else if (event is AddMenuDefList) {
      yield* _mapAddMenuDefListToState(event);
    } else if (event is UpdateMenuDefList) {
      yield* _mapUpdateMenuDefListToState(event);
    } else if (event is DeleteMenuDefList) {
      yield* _mapDeleteMenuDefListToState(event);
    } else if (event is MenuDefListUpdated) {
      yield* _mapMenuDefListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _menuDefsListSubscription?.cancel();
    return super.close();
  }

}


