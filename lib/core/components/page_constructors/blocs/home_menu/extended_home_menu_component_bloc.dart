import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';

import 'package:eliud_core_main/model/home_menu_model.dart';

import 'extended_home_menu_component_event.dart';
import 'extended_home_menu_component_state.dart';

class ExtendedHomeMenuComponentBloc extends Bloc<ExtendedHomeMenuComponentEvent,
    ExtendedHomeMenuComponentState> {
  StreamSubscription? _homeMenuSubscription;
  StreamSubscription? _menuDefSubscription;

  void _listenToHomeMenu(HomeMenuModel homeMenu) {
    _homeMenuSubscription?.cancel();
    _homeMenuSubscription = homeMenuRepository(appId: homeMenu.appId)!
        .listenTo(homeMenu.documentID, (value) {
      if (value != null) add(ExtendedHomeMenuComponentUpdated(value: value));
    });

    _menuDefSubscription?.cancel();
    _menuDefSubscription = menuDefRepository(appId: homeMenu.appId)!
        .listenTo(homeMenu.menu!.documentID, (value) {
      var newHomeMenu = homeMenu.copyWith(menu: value);
      if (value != null) {
        add(ExtendedHomeMenuComponentUpdated(value: newHomeMenu));
      }
    });
  }

  ExtendedHomeMenuComponentBloc()
      : super(ExtendedHomeMenuComponentUninitialized()) {
    on<ExtendedHomeMenuInitEvent>(
        (event, emit) => _listenToHomeMenu(event.value));
    on<ExtendedHomeMenuComponentUpdated>((event, emit) =>
        emit(ExtendedHomeMenuComponentLoaded(value: event.value)));
  }

  @override
  Future<void> close() {
    _homeMenuSubscription?.cancel();
    _menuDefSubscription?.cancel();
    return super.close();
  }
}
