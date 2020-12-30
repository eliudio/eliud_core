/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/menu_item_repository.dart';
import 'package:eliud_core/model/menu_item_list_event.dart';
import 'package:eliud_core/model/menu_item_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class MenuItemListBloc extends Bloc<MenuItemListEvent, MenuItemListState> {
  final MenuItemRepository _menuItemRepository;
  StreamSubscription _menuItemsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  MenuItemListBloc(this.accessBloc,{ this.eliudQuery, @required MenuItemRepository menuItemRepository })
      : assert(menuItemRepository != null),
      _menuItemRepository = menuItemRepository,
      super(MenuItemListLoading());

  Stream<MenuItemListState> _mapLoadMenuItemListToState({ String orderBy, bool descending }) async* {
    _menuItemsListSubscription?.cancel();
    _menuItemsListSubscription = _menuItemRepository.listen((list) => add(MenuItemListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<MenuItemListState> _mapLoadMenuItemListWithDetailsToState() async* {
    _menuItemsListSubscription?.cancel();
    _menuItemsListSubscription = _menuItemRepository.listenWithDetails((list) => add(MenuItemListUpdated(value: list)), );
  }

  Stream<MenuItemListState> _mapAddMenuItemListToState(AddMenuItemList event) async* {
    _menuItemRepository.add(event.value);
  }

  Stream<MenuItemListState> _mapUpdateMenuItemListToState(UpdateMenuItemList event) async* {
    _menuItemRepository.update(event.value);
  }

  Stream<MenuItemListState> _mapDeleteMenuItemListToState(DeleteMenuItemList event) async* {
    _menuItemRepository.delete(event.value);
  }

  Stream<MenuItemListState> _mapMenuItemListUpdatedToState(MenuItemListUpdated event) async* {
    yield MenuItemListLoaded(values: event.value);
  }


  @override
  Stream<MenuItemListState> mapEventToState(MenuItemListEvent event) async* {
    final currentState = state;
    if (event is LoadMenuItemList) {
      yield* _mapLoadMenuItemListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadMenuItemListWithDetails) {
      yield* _mapLoadMenuItemListWithDetailsToState();
    } else if (event is AddMenuItemList) {
      yield* _mapAddMenuItemListToState(event);
    } else if (event is UpdateMenuItemList) {
      yield* _mapUpdateMenuItemListToState(event);
    } else if (event is DeleteMenuItemList) {
      yield* _mapDeleteMenuItemListToState(event);
    } else if (event is MenuItemListUpdated) {
      yield* _mapMenuItemListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _menuItemsListSubscription?.cancel();
    return super.close();
  }

}


