import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
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
  final GlobalKey<NavigatorState>? navigatorKey;

  static void register(PackageActionHandler handler) {
    _registeredActionHandlers.add(handler);
  }

  Router(this.navigatorKey);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Arguments? arguments;
    if (settings.arguments is Arguments) {
      arguments = settings.arguments as Arguments?;
    }
    switch (settings.name) {
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
  }

  static Route<dynamic> getRoute(
      String path, Map<String, dynamic>? parameters) {
    final pagePath = path.split('/');
    if ((pagePath != null) && (pagePath.length == 2)) {
      final appId = pagePath[0];
      final pageId = pagePath[1];

      return pageRouteBuilderWithAppId(appId,
          pageId: pageId,
          parameters: parameters,
          page: Registry.registry()!
              .page(appId: appId, pageId: pageId, parameters: parameters));
    } else {
      return error('No route defined for $path');
    }
  }

  static PageRouteBuilder error(String error) {
    return FadeRoute(
        name: 'error',
        page: Scaffold(body: Center(child: Text(error))),
        milliseconds: 1000);
  }

  static void navigateTo(BuildContext context, ActionModel action,
      {Map<String, dynamic>? parameters}) async {
    if (action.hasAccess(context)) {
      if (action is FunctionToRun) {
        action.actionToRun();
      } else if (action is GotoPage) {
        BlocProvider.of<AccessBloc>(context).add(
            GotoPageEvent(action.appID, action.pageID, parameters: parameters));
      } else if (action is OpenDialog) {
        Registry.registry()!
            .openDialog(context, id: action.dialogID, parameters: parameters);
        // NAVIGATION-USING-BLOC
        // We should be using this instead: BlocProvider.of<AccessBloc>(context).add(OpenDialogEvent(action.dialogID, parameters: parameters));
      } else if (action is SwitchApp) {
        BlocProvider.of<AccessBloc>(context)
            .add(SwitchAppWithIDEvent(appId: action.toAppID, goHome: true));
      } else if (action is InternalAction) {
        switch (action.internalActionEnum) {
          case InternalActionEnum.Login:
            BlocProvider.of<AccessBloc>(context).add(LoginEvent(appId: action.appID));
            break;
          case InternalActionEnum.Logout:
            var appId = AccessBloc.currentApp(context).documentID!;
            BlocProvider.of<AccessBloc>(context).add(LogoutEvent(appId: appId));
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

  static String getCurrentAppId(BuildContext context) {
    return getPageContextInfo(context).appId;
  }

  static PageContextInfo getPageContextInfo(BuildContext context) {
    var modalRoute = ModalRoute.of(context) as ModalRoute;
    return getPageContextInfoWithRoute(modalRoute);
  }

  static PageContextInfo getPageContextInfoWithRoute(ModalRoute modalRoute) {
    var settings = modalRoute.settings;
    var fullPageId = settings.name;
    if (fullPageId == null) {
      throw Exception('No page selected');
    }
    var split = fullPageId.split('/');
    if (split.length < 2) {
      throw Exception('Page name has unexpected format: $fullPageId');
    }
    var appId = split[0];
    var pageId = split[1];
    Map<String, dynamic>? parameters;
    if (settings.arguments != null) {
      parameters = settings.arguments as Map<String, dynamic>;
    }
    return PageContextInfo(appId, pageId, parameters: parameters);
  }
}

class PageContextInfo {
  final String appId;
  final String pageId;
  Map<String, dynamic>? parameters;

  PageContextInfo(this.appId, this.pageId, {this.parameters});
}
