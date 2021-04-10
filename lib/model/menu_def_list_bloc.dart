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
import 'package:eliud_core/tools/query/query_tools.dart';


const _menuDefLimit = 5;

class MenuDefListBloc extends Bloc<MenuDefListEvent, MenuDefListState> {
  final MenuDefRepository _menuDefRepository;
  StreamSubscription? _menuDefsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  MenuDefListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MenuDefRepository menuDefRepository})
      : assert(menuDefRepository != null),
        _menuDefRepository = menuDefRepository,
        super(MenuDefListLoading());

  Stream<MenuDefListState> _mapLoadMenuDefListToState() async* {
    int amountNow =  (state is MenuDefListLoaded) ? (state as MenuDefListLoaded).values!.length : 0;
    _menuDefsListSubscription?.cancel();
    _menuDefsListSubscription = _menuDefRepository.listen(
          (list) => add(MenuDefListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _menuDefLimit : null
    );
  }

  Stream<MenuDefListState> _mapLoadMenuDefListWithDetailsToState() async* {
    int amountNow =  (state is MenuDefListLoaded) ? (state as MenuDefListLoaded).values!.length : 0;
    _menuDefsListSubscription?.cancel();
    _menuDefsListSubscription = _menuDefRepository.listenWithDetails(
            (list) => add(MenuDefListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _menuDefLimit : null
    );
  }

  Stream<MenuDefListState> _mapAddMenuDefListToState(AddMenuDefList event) async* {
    var value = event.value;
    if (value != null) 
      _menuDefRepository.add(value);
  }

  Stream<MenuDefListState> _mapUpdateMenuDefListToState(UpdateMenuDefList event) async* {
    var value = event.value;
    if (value != null) 
      _menuDefRepository.update(value);
  }

  Stream<MenuDefListState> _mapDeleteMenuDefListToState(DeleteMenuDefList event) async* {
    var value = event.value;
    if (value != null) 
      _menuDefRepository.delete(value);
  }

  Stream<MenuDefListState> _mapMenuDefListUpdatedToState(
      MenuDefListUpdated event) async* {
    yield MenuDefListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<MenuDefListState> mapEventToState(MenuDefListEvent event) async* {
    if (event is LoadMenuDefList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadMenuDefListToState();
      } else {
        yield* _mapLoadMenuDefListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


