import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AccessBloc accessBloc;
  StreamSubscription? _appSubscription;
  final GlobalKey<NavigatorState> navigatorKey;

  AppBloc(this.accessBloc, this.navigatorKey) : super(UndeterminedAppState());

  Future<AppModel> _fetchApp(String id) async {
    var appModel = await AbstractMainRepositorySingleton.singleton
        .appRepository()!
        .get(id);
    if (appModel == null) {
      throw Exception("Unable to find app with id '$id");
    } else {
      return appModel;
    }
  }

  String getHomepage(AppModel app) {
    var accessState = accessBloc.state;
    var appId = app.documentID!;
    var privilegeLevel;
    if (accessState is LoggedIn) {
      privilegeLevel = accessState.getPrivilegeLevel(appId);
    } else {
      if (app.homePages!.homePagePublic != null) return app.homePages!.homePagePublic!;
      throw Exception("homePagePublic for app with id '$appId' is null");
    }
    if (accessState.isBlocked(appId)) {
      if (app.homePages!.homePageBlockedMember != null) return app.homePages!.homePageBlockedMember!;
      throw Exception("homePageBlockedMember for app with id '$appId' is null");
    }
    if ((privilegeLevel.index >= PrivilegeLevel.OwnerPrivilege.index) &&
        (app.homePages!.homePageOwner != null)) {
      if (app.homePages!.homePageOwner != null) return app.homePages!.homePageOwner!;
      throw Exception("homePageOwner for app with id '$appId' is null");
    }
    if ((privilegeLevel.index >= PrivilegeLevel.Level2Privilege.index) &&
        (app.homePages!.homePageLevel2Member != null)) {
      if (app.homePages!.homePageLevel2Member != null) return app.homePages!.homePageLevel2Member!;
      throw Exception("homePageLevel2Member for app with id '$appId' is null");
    }
    if ((privilegeLevel.index >= PrivilegeLevel.Level1Privilege.index) &&
        (app.homePages!.homePageLevel1Member != null)) {
      if (app.homePages!.homePageLevel1Member != null) return app.homePages!.homePageLevel1Member!;
      throw Exception("homePageLevel1Member for app with id '$appId' is null");
    }
    if ((privilegeLevel.index >= PrivilegeLevel.NoPrivilege.index) &&
        (app.homePages!.homePageSubscribedMember != null)) {
      if (app.homePages!.homePageSubscribedMember != null) return app.homePages!.homePageSubscribedMember!;
      throw Exception("homePageSubscribedMember for app with id '$appId' is null");
    }
    throw Exception("Unknown privilegeLevel $privilegeLevel for app with id '$appId'");
  }

  void goHome(AppModel app) {
    gotoPage(app.documentID!, getHomepage(app));
  }

  void gotoPage(String appId, String pageId, {Map<String, dynamic>? parameters}) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.pushNamed(eliudrouter.Router.pageRoute, arguments: eliudrouter.Arguments(appId + '/' + pageId, parameters));
    } else {
      throw Exception("navigatorKey.currentState is null");
    }
  }

  Stream<AppState> _listenToApp(String appId) async* {
    await _appSubscription?.cancel();
    _appSubscription = appRepository(appId: appId)!.listenTo(appId, (value) {
      if (value != null) add(AppUpdated(value));
    });
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is SelectMainApp) {
      var app = await _fetchApp(event.appId);
      accessBloc.add(AddAppEvent(app));
      yield* _listenToApp(event.appId);
    } else if (event is SelectOtherApp) {
      var app = await _fetchApp(event.appId);
      accessBloc.add(AddAppEvent(app));
      goHome(app);
      yield* _listenToApp(event.appId);
    } else if (event is AppUpdated) {
      yield AppLoaded(event.app);
    } else if (state is AppLoaded) {
      var theState = state as AppLoaded;
      if (event is GotoPageEvent) {
        if (theState.app.documentID == event.appId) {
          gotoPage(event.appId, event.pageId, parameters: event.parameters);
        } else {
          add(SelectOtherApp(event.appId));
          add(event);
        }
      }
    }
  }

  static AppModel currentApp(BuildContext context) {
    var state = BlocProvider.of<AppBloc>(context).state;
    if (state is AppLoaded) {
      return state.app;
    }
    throw Exception('No current app');
  }

  static String currentAppId(BuildContext context) {
    var state = BlocProvider.of<AppBloc>(context).state;
    if (state is AppLoaded) {
      return state.app.documentID!;
    }
    throw Exception('No current app');
  }
}
