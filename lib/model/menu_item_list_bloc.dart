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
import 'package:eliud_core/tools/query/query_tools.dart';



class MenuItemListBloc extends Bloc<MenuItemListEvent, MenuItemListState> {
  final MenuItemRepository _menuItemRepository;
  StreamSubscription? _menuItemsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int menuItemLimit;

  MenuItemListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MenuItemRepository menuItemRepository, this.menuItemLimit = 5})
      : assert(menuItemRepository != null),
        _menuItemRepository = menuItemRepository,
        super(MenuItemListLoading());

  Stream<MenuItemListState> _mapLoadMenuItemListToState() async* {
    int amountNow =  (state is MenuItemListLoaded) ? (state as MenuItemListLoaded).values!.length : 0;
    _menuItemsListSubscription?.cancel();
    _menuItemsListSubscription = _menuItemRepository.listen(
          (list) => add(MenuItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * menuItemLimit : null
    );
  }

  Stream<MenuItemListState> _mapLoadMenuItemListWithDetailsToState() async* {
    int amountNow =  (state is MenuItemListLoaded) ? (state as MenuItemListLoaded).values!.length : 0;
    _menuItemsListSubscription?.cancel();
    _menuItemsListSubscription = _menuItemRepository.listenWithDetails(
            (list) => add(MenuItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * menuItemLimit : null
    );
  }

  Stream<MenuItemListState> _mapAddMenuItemListToState(AddMenuItemList event) async* {
    var value = event.value;
    if (value != null) 
      _menuItemRepository.add(value);
  }

  Stream<MenuItemListState> _mapUpdateMenuItemListToState(UpdateMenuItemList event) async* {
    var value = event.value;
    if (value != null) 
      _menuItemRepository.update(value);
  }

  Stream<MenuItemListState> _mapDeleteMenuItemListToState(DeleteMenuItemList event) async* {
    var value = event.value;
    if (value != null) 
      _menuItemRepository.delete(value);
  }

  Stream<MenuItemListState> _mapMenuItemListUpdatedToState(
      MenuItemListUpdated event) async* {
    yield MenuItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<MenuItemListState> mapEventToState(MenuItemListEvent event) async* {
    if (event is LoadMenuItemList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadMenuItemListToState();
      } else {
        yield* _mapLoadMenuItemListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadMenuItemListWithDetailsToState();
    } else if (event is MenuItemChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadMenuItemListToState();
      } else {
        yield* _mapLoadMenuItemListWithDetailsToState();
      }
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


