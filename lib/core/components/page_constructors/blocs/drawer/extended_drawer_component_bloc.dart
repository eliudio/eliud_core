import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';

import 'package:eliud_core_main/model/drawer_model.dart';

import 'extended_drawer_component_event.dart';
import 'extended_drawer_component_state.dart';

class ExtendedDrawerComponentBloc
    extends Bloc<ExtendedDrawerComponentEvent, ExtendedDrawerComponentState> {
  StreamSubscription? _drawerSubscription;
  StreamSubscription? _menuDefSubscription;

  void _listenToDrawer(DrawerModel drawer) {
    _drawerSubscription?.cancel();
    _drawerSubscription = drawerRepository(appId: drawer.appId)!
        .listenTo(drawer.documentID, (value) {
      if (value != null) add(ExtendedDrawerComponentUpdated(value: value));
    });

    _menuDefSubscription?.cancel();
    _menuDefSubscription = menuDefRepository(appId: drawer.appId)!
        .listenTo(drawer.menu!.documentID, (value) {
      var newDrawer = drawer.copyWith(menu: value);
      if (value != null) add(ExtendedDrawerComponentUpdated(value: newDrawer));
    });
  }

  ExtendedDrawerComponentBloc()
      : super(ExtendedDrawerComponentUninitialized()) {
    on<ExtendedDrawerInitEvent>((event, emit) => _listenToDrawer(event.value));
    on<ExtendedDrawerComponentUpdated>((event, emit) =>
        emit(ExtendedDrawerComponentLoaded(value: event.value)));
  }

  @override
  Future<void> close() {
    _drawerSubscription?.cancel();
    _menuDefSubscription?.cancel();
    return super.close();
  }
}
