import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_bar_model.dart';

import 'extended_app_bar_component_event.dart';
import 'extended_app_bar_component_state.dart';

class ExtendedAppBarComponentBloc
    extends Bloc<ExtendedAppBarComponentEvent, ExtendedAppBarComponentState> {
  StreamSubscription? _appBarSubscription;
  StreamSubscription? _menuDefSubscription;

  void _listenToAppBar(AppBarModel appBar) {
    _appBarSubscription?.cancel();
    _appBarSubscription = appBarRepository(appId: appBar.appId)!
        .listenTo(appBar.documentID, (value) {
      if (value != null) add(ExtendedAppBarComponentUpdated(value: value));
    });

    _menuDefSubscription?.cancel();
    _menuDefSubscription = menuDefRepository(appId: appBar.appId)!
        .listenTo(appBar.iconMenu!.documentID, (value) {
      var newAppBar = appBar.copyWith(iconMenu: value);
      if (value != null) add(ExtendedAppBarComponentUpdated(value: newAppBar));
    });
  }

  ExtendedAppBarComponentBloc()
      : super(ExtendedAppBarComponentUninitialized()) {
    on<ExtendedAppBarInitEvent>((event, emit) => _listenToAppBar(event.value));

    on<ExtendedAppBarComponentUpdated>((event, emit) =>
        emit(ExtendedAppBarComponentLoaded(value: event.value)));
  }

  @override
  Future<void> close() {
    _appBarSubscription?.cancel();
    _menuDefSubscription?.cancel();
    return super.close();
  }
}
