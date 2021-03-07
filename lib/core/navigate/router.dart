import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/action/action_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/navigation_event.dart';

class Arguments {
  final String mainArgument;
  final Map<String, Object> parameters;

  Arguments(this.mainArgument, this.parameters);
}

abstract class PackageActionHandler {
  void navigateTo(BuildContext context, ActionModel action,
      {Map<String, Object> parameters});
}

class Router {
  static const String homeRoute = '/';
  static const String pageRoute = '/page';
  static const String justASecond = '/justASecond';

  static final List<PackageActionHandler> _registeredActionHandlers = [];

  static void register(PackageActionHandler handler) {
    _registeredActionHandlers.add(handler);
  }

  final AccessBloc accessBloc;

  Router(this.accessBloc);

  String getHomepage(AppLoaded state) {
    var privilegeLevel;
    if (state is LoggedIn) {
      privilegeLevel = state.privilegeLevel;
    } else {
      privilegeLevel = PrivilegeLevel.NoPrivilege;
    }
    if (state.isBlocked()) return state.app.homePages.homePageBlockedMemberId;
    if ((privilegeLevel.index >= PrivilegeLevel.OwnerPrivilege.index) &&
        (state.app.homePages.homePageOwnerId != null)) {
      return state.app.homePages.homePageOwnerId;
    }
    if ((privilegeLevel.index >= PrivilegeLevel.Level2Privilege.index) &&
        (state.app.homePages.homePageLevel2MemberId != null)) {
      return state.app.homePages.homePageLevel2MemberId;
    }
    if ((privilegeLevel.index >= PrivilegeLevel.Level1Privilege.index) &&
        (state.app.homePages.homePageLevel1MemberId != null)) {
      return state.app.homePages.homePageLevel1MemberId;
    }
    if ((privilegeLevel.index >= PrivilegeLevel.NoPrivilege.index) &&
        (state.app.homePages.homePageSubscribedMemberId != null)) {
      return state.app.homePages.homePageSubscribedMemberId;
    }

    print('Unknown privilegeLevel $privilegeLevel');
    return state.app.homePages.homePageSubscribedMemberId;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    var theState = accessBloc.state;
    if (theState is AppLoaded) {
      Arguments arguments;
      if (settings.arguments is Arguments) {
        arguments = settings.arguments;
      }
      switch (settings.name) {
        case '':
          // in flutterweb, the initialRoute is "", not "/"
          var pageId = getHomepage(theState);
          return pageRouteBuilder(theState.app,
              pageId: pageId, page: Registry.registry().page(id: pageId));
        case homeRoute:
          var pageId = getHomepage(theState);
          return pageRouteBuilder(theState.app,
              pageId: pageId, page: Registry.registry().page(id: pageId));
        case justASecond:
          return pageRouteBuilder(theState.app,
              page: justASecondWidget(
                  arguments == null ? '?' : arguments.mainArgument));
        case pageRoute:
          return pageRouteBuilder(theState.app,
              pageId: arguments.mainArgument,
              parameters: arguments.parameters,
              page: Registry.registry().page(
                  id: arguments == null ? null : arguments.mainArgument,
                  parameters: arguments == null ? null : arguments.parameters));
        default:
          final settingsUri = Uri.parse(settings.name);
          final pagePath = settingsUri.path.split('/');
          if ((pagePath != null) && (pagePath.length == 2)) {
            final appId = pagePath[0];
            print('appId is =' + appId);
            if (theState.app == null) {
              print('theState app is null');
            }
            if ((theState.app.documentID == null) ||
                (theState.app.documentID != appId)) {
              return error(
                  'Not allowing to switch to app ' + appId + '.');
            } else {
              final pageId = pagePath[1];
              print('paggeId is ' + pageId);
              final parameters = settingsUri.queryParameters;
              if (pageId != null) print(pageId);
              if (parameters != null) print(parameters);
              var page =
                  Registry.registry().page(id: pageId, parameters: parameters);
              if (page != null) {
                return pageRouteBuilder(theState.app,
                    pageId: pageId, parameters: parameters, page: page);
              }
            }
          }
      }
      return error('No route defined for ${settings.name}!');
    } else {
      return error("App not loaded, so can't load page!");
    }
  }

  PageRouteBuilder error(String error) {
    return FadeRoute(
        name: 'error',
        page: Scaffold(body: Center(child: Text(error))),
        milliseconds: 1000);
  }

  final List<Color> _colors = [Colors.white, Colors.grey];
  final List<double> _stops = [0.0, 0.7];
  Widget justASecondWidget(String message) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            child: Center(
          child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _colors,
                  stops: _stops,
                ),
                borderRadius: BorderRadius.all(const Radius.circular(40.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(.3),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(2, 2), // changes position of shadow
                  ),
                ],
              ),
              //color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DelayedCircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(message,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                        )),
                  )
                ],
              )),
        )));
  }

  static void navigateTo(BuildContext context, ActionModel action,
      {Map<String, Object> parameters}) async {
    if (action.hasAccess(context)) {
      if (action is GotoPage) {
        if (AccessBloc.appId(context) == action.appID) {
          BlocProvider.of<NavigatorBloc>(context)
              .add(GoToPageEvent(action.pageID, parameters: parameters));
        } else {
          BlocProvider.of<AccessBloc>(context).add(
              SwitchAppAndPageEvent(action.appID, action.pageID, parameters));
        }
      } else if (action is OpenDialog) {
        await Registry.registry()
            .openDialog(context, id: action.dialogID, parameters: parameters);
      } else if (action is SwitchApp) {
        var appId = action.toAppID;
        BlocProvider.of<AccessBloc>(context).add(SwitchAppEvent(appId));
      } else if (action is InternalAction) {
        switch (action.internalActionEnum) {
          case InternalActionEnum.Login:
            BlocProvider.of<AccessBloc>(context).add(LoginEvent());
            break;
          case InternalActionEnum.Logout:
            BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
            break;
          case InternalActionEnum.Flush:
            AbstractRepositorySingleton.singleton
                .flush(AccessBloc.appId(context));
            BlocProvider.of<NavigatorBloc>(context).add(GoHome());
            break;
          default:
            return null;
        }
      } else {
        for (var i = 0; i < _registeredActionHandlers.length; i++) {
          _registeredActionHandlers[i]
              .navigateTo(context, action, parameters: parameters);
        }
      }
    } else {
      // return Text("no access");
      return null;
    }
  }

  static void navigateToPage(NavigatorBloc bloc, ActionModel action,
      {Map<String, Object> parameters}) async {
    if (action is GotoPage) {
      bloc.add(GoToPageEvent(action.pageID, parameters: parameters));
    } else {
      throw "I didn't expect this action type";
    }
  }

  /*
   * Sometimes we need to brute refresh the current page and do this by (re)navigating to it
   */
  static void bruteRefreshPage(BuildContext context) {
    var appId = AccessBloc.appId(context);
    // force goto that page
    var modalRoute = ModalRoute.of(context);
    var settings = modalRoute.settings;
    var parentPageId = settings.name;
    var refreshPage = GotoPage(appId, pageID: parentPageId);
    navigateTo(context, refreshPage);
  }
}
