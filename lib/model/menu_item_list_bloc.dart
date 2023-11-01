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

import 'package:eliud_core/model/menu_item_repository.dart';
import 'package:eliud_core/model/menu_item_list_event.dart';
import 'package:eliud_core/model/menu_item_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'menu_item_model.dart';

typedef List<MenuItemModel?> FilterMenuItemModels(List<MenuItemModel?> values);



class MenuItemListBloc extends Bloc<MenuItemListEvent, MenuItemListState> {
  final FilterMenuItemModels? filter;
  final MenuItemRepository _menuItemRepository;
  StreamSubscription? _menuItemsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int menuItemLimit;

  MenuItemListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MenuItemRepository menuItemRepository, this.menuItemLimit = 5})
      : _menuItemRepository = menuItemRepository,
        super(MenuItemListLoading()) {
    on <LoadMenuItemList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMenuItemListToState();
      } else {
        _mapLoadMenuItemListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMenuItemListWithDetailsToState();
    });
    
    on <MenuItemChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMenuItemListToState();
      } else {
        _mapLoadMenuItemListWithDetailsToState();
      }
    });
      
    on <AddMenuItemList> ((event, emit) async {
      await _mapAddMenuItemListToState(event);
    });
    
    on <UpdateMenuItemList> ((event, emit) async {
      await _mapUpdateMenuItemListToState(event);
    });
    
    on <DeleteMenuItemList> ((event, emit) async {
      await _mapDeleteMenuItemListToState(event);
    });
    
    on <MenuItemListUpdated> ((event, emit) {
      emit(_mapMenuItemListUpdatedToState(event));
    });
  }

  List<MenuItemModel?> _filter(List<MenuItemModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMenuItemListToState() async {
    int amountNow =  (state is MenuItemListLoaded) ? (state as MenuItemListLoaded).values!.length : 0;
    _menuItemsListSubscription?.cancel();
    _menuItemsListSubscription = _menuItemRepository.listen(
          (list) => add(MenuItemListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * menuItemLimit : null
    );
  }

  Future<void> _mapLoadMenuItemListWithDetailsToState() async {
    int amountNow =  (state is MenuItemListLoaded) ? (state as MenuItemListLoaded).values!.length : 0;
    _menuItemsListSubscription?.cancel();
    _menuItemsListSubscription = _menuItemRepository.listenWithDetails(
            (list) => add(MenuItemListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * menuItemLimit : null
    );
  }

  Future<void> _mapAddMenuItemListToState(AddMenuItemList event) async {
    var value = event.value;
    if (value != null) {
      await _menuItemRepository.add(value);
    }
  }

  Future<void> _mapUpdateMenuItemListToState(UpdateMenuItemList event) async {
    var value = event.value;
    if (value != null) {
      await _menuItemRepository.update(value);
    }
  }

  Future<void> _mapDeleteMenuItemListToState(DeleteMenuItemList event) async {
    var value = event.value;
    if (value != null) {
      await _menuItemRepository.delete(value);
    }
  }

  MenuItemListLoaded _mapMenuItemListUpdatedToState(
      MenuItemListUpdated event) => MenuItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _menuItemsListSubscription?.cancel();
    return super.close();
  }
}


