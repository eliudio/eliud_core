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

import 'package:eliud_core/model/menu_def_repository.dart';
import 'package:eliud_core/model/menu_def_list_event.dart';
import 'package:eliud_core/model/menu_def_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'menu_def_model.dart';

typedef FilterMenuDefModels = List<MenuDefModel?> Function(
    List<MenuDefModel?> values);

class MenuDefListBloc extends Bloc<MenuDefListEvent, MenuDefListState> {
  final FilterMenuDefModels? filter;
  final MenuDefRepository _menuDefRepository;
  StreamSubscription? _menuDefsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int menuDefLimit;

  MenuDefListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required MenuDefRepository menuDefRepository,
      this.menuDefLimit = 5})
      : _menuDefRepository = menuDefRepository,
        super(MenuDefListLoading()) {
    on<LoadMenuDefList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMenuDefListToState();
      } else {
        _mapLoadMenuDefListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMenuDefListWithDetailsToState();
    });

    on<MenuDefChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMenuDefListToState();
      } else {
        _mapLoadMenuDefListWithDetailsToState();
      }
    });

    on<AddMenuDefList>((event, emit) async {
      await _mapAddMenuDefListToState(event);
    });

    on<UpdateMenuDefList>((event, emit) async {
      await _mapUpdateMenuDefListToState(event);
    });

    on<DeleteMenuDefList>((event, emit) async {
      await _mapDeleteMenuDefListToState(event);
    });

    on<MenuDefListUpdated>((event, emit) {
      emit(_mapMenuDefListUpdatedToState(event));
    });
  }

  List<MenuDefModel?> _filter(List<MenuDefModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMenuDefListToState() async {
    int amountNow = (state is MenuDefListLoaded)
        ? (state as MenuDefListLoaded).values!.length
        : 0;
    _menuDefsListSubscription?.cancel();
    _menuDefsListSubscription = _menuDefRepository.listen(
        (list) => add(MenuDefListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * menuDefLimit : null);
  }

  Future<void> _mapLoadMenuDefListWithDetailsToState() async {
    int amountNow = (state is MenuDefListLoaded)
        ? (state as MenuDefListLoaded).values!.length
        : 0;
    _menuDefsListSubscription?.cancel();
    _menuDefsListSubscription = _menuDefRepository.listenWithDetails(
        (list) => add(MenuDefListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * menuDefLimit : null);
  }

  Future<void> _mapAddMenuDefListToState(AddMenuDefList event) async {
    var value = event.value;
    if (value != null) {
      await _menuDefRepository.add(value);
    }
  }

  Future<void> _mapUpdateMenuDefListToState(UpdateMenuDefList event) async {
    var value = event.value;
    if (value != null) {
      await _menuDefRepository.update(value);
    }
  }

  Future<void> _mapDeleteMenuDefListToState(DeleteMenuDefList event) async {
    var value = event.value;
    if (value != null) {
      await _menuDefRepository.delete(value);
    }
  }

  MenuDefListLoaded _mapMenuDefListUpdatedToState(MenuDefListUpdated event) =>
      MenuDefListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _menuDefsListSubscription?.cancel();
    return super.close();
  }
}
