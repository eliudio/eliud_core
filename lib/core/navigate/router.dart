import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/navigation_event.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registry.dart';

class Arguments {
  final String? mainArgument;
  final Map<String, dynamic>? parameters;

  Arguments(this.mainArgument, this.parameters);
}

abstract class PackageActionHandler {
  void navigateTo(BuildContext context, ActionModel action,
      {Map<String, dynamic>? parameters});
}

class Router {
  static const String homeRoute = '/';
  static const String pageRoute = '/page';
  static const String messageRoute = '/message';
  static const String justASecond = '/justASecond';

  static final List<PackageActionHandler> _registeredActionHandlers = [];

  static void register(PackageActionHandler handler) {
    _registeredActionHandlers.add(handler);
  }

  final AccessBloc accessBloc;

  Router(this.accessBloc);

  static Route<dynamic> generateRoute(RouteSettings settings) {
/*
    AccessState theState = accessBloc.state;
    if (theState is AppLoaded) {
*/
    Arguments? arguments;
    if (settings.arguments is Arguments) {
      arguments = settings.arguments as Arguments?;
    }
    switch (settings.name) {
/*
        case '':
          // in flutterweb, the initialRoute is "", not "/"
          return pageRouteBuilder(theState.app,
              pageId: 'playstore', page: Registry.registry()!.page(id: 'playstore'));
        case homeRoute:
          return pageRouteBuilder(theState.app,
              pageId: 'playstore', page: Registry.registry()!.page(id: 'playstore'));
        case justASecond:
          return pageRouteBuilder(theState.app,
              page: justASecondWidget(
                  arguments == null ? '?' : arguments.mainArgument!));
*/
      case pageRoute:
        if ((arguments != null) && (arguments.mainArgument != null)) {
          return getRoute(arguments.mainArgument!, arguments.parameters);
        }
        break;
      case messageRoute:
        var value = settings.name;
        if (arguments != null) {
          value = value! + arguments.mainArgument!;
          for (var v in arguments.parameters!.values) {
            value = value! + (v as String);
          }
        }
        return error(settings.arguments as String);
      default:
        var settingsUri = Uri.parse(settings.name!);
        var path = settingsUri.path;
        var parameters = settingsUri.queryParameters;
        return getRoute(path, parameters);
    }
    return error('No route defined for ${settings.name}!');
/*
    } else {
      return error("App not loaded, so can't load page!");
    }
*/
  }

  static Route<dynamic> getRoute(String path, Map<String, dynamic>? parameters) {
    final pagePath = path.split('/');
    if ((pagePath != null) && (pagePath.length == 2)) {
      final appId = pagePath[0];
      final pageId = pagePath[1];

      var page = Registry.registry()!
          .page(appId: appId, pageId: pageId, parameters: parameters);
      if (page != null) {
        return pageRouteBuilderWithAppId(appId,
            pageId: pageId, parameters: parameters, page: page);
      }
    }
    return error('No route defined for $path');
  }

  static PageRouteBuilder error(String error) {
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
      {Map<String, dynamic>? parameters}) async {
    if (action.hasAccess(context)) {
      if (action is FunctionToRun) {
        action.actionToRun();
      } else if (action is GotoPage) {
        if (AccessBloc.appId(context) == action.appID) {
          BlocProvider.of<NavigatorBloc>(context).add(GoToPageEvent(
              action.appID, action.pageID,
              parameters: parameters));
        } else {
          BlocProvider.of<AccessBloc>(context).add(
              SwitchAppAndPageEvent(action.appID, action.pageID, parameters));
        }
      } else if (action is OpenDialog) {
        await Registry.registry()!
            .openDialog(context, id: action.dialogID, parameters: parameters);
      } else if (action is SwitchApp) {
        var appId = action.toAppID;
        BlocProvider.of<AccessBloc>(context).add(SwitchAppEvent(appId));
      } else if (action is InternalAction) {
        switch (action.internalActionEnum) {
          case InternalActionEnum.Login:
/*
            await Registry.registry()!
                .openDialog(context, id: action.dialogID, parameters: parameters);
*/
            BlocProvider.of<AccessBloc>(context).add(LoginEvent());
            break;
          case InternalActionEnum.Logout:
            BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
            break;
          case InternalActionEnum.Flush:
            AbstractRepositorySingleton.singleton
                .flush(AccessBloc.appId(context));
//            BlocProvider.of<NavigatorBloc>(context).add(GoHome());
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
      {Map<String, dynamic>? parameters}) async {
    if (action is GotoPage) {
      bloc.add(
          GoToPageEvent(action.appID, action.pageID, parameters: parameters));
    } else {
      throw "I didn't expect this action type";
    }
  }

  static void message(NavigatorBloc? bloc, String message) {
    if (bloc != null) bloc.add(MessageEvent(message));
  }

  /*
   * Sometimes we need to brute refresh the current page and do this by (re)navigating to it
   */
/*
  static void bruteRefreshPage(BuildContext context) {
    var appId = AccessBloc.appId(context);
    // force goto that page
    var modalRoute = ModalRoute.of(context) as ModalRoute<Object>;
    var settings = modalRoute.settings;
    var parentPageId = settings.name;
    var refreshPage = GotoPage(appId, pageID: parentPageId);
    navigateTo(context, refreshPage);
  }
*/
}
