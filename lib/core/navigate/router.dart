import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/apis/action_api/actions/function_to_run.dart';
import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';
import 'package:eliud_core_main/apis/action_api/actions/internal_action.dart';
import 'package:eliud_core_main/apis/action_api/actions/open_dialog.dart';
import 'package:eliud_core_main/apis/action_api/actions/switch_app.dart';
import 'package:eliud_core_main/apis/routerapi/arguments.dart';
import 'package:eliud_core_main/apis/routerapi/router_api.dart';
import 'package:eliud_core_main/tools/route_builders/route_builders.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/apis/style/frontend/has_page_route_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../access/access_event.dart';
import '../registry.dart';
import '../widgets/member_widgets/login_widget.dart';

abstract class PackageActionHandler {
  void navigateTo(BuildContext context, ActionModel action,
      {Map<String, dynamic>? parameters});
}

class Router {
  static final List<PackageActionHandler> _registeredActionHandlers = [];

  static void register(PackageActionHandler handler) {
    _registeredActionHandlers.add(handler);
  }

  final AccessBloc accessBloc;

  Router(this.accessBloc);

  Route<dynamic> generateRoute(RouteSettings settings) {
    Arguments? arguments;
    if (settings.arguments is Arguments) {
      arguments = settings.arguments as Arguments?;
    }
    switch (settings.name) {
      case RouterApi.pageRoute:
        if ((arguments != null) && (arguments.mainArgument != null)) {
          return getRoute(arguments.mainArgument!, arguments.parameters);
        }
        break;
      case RouterApi.messageRoute:
        if (arguments != null) {
          if (arguments.parameters != null) {
            var message = arguments.parameters!['message'];
            if (message != null) {
              return error(arguments.mainArgument!, message);
            } else {
              return error(arguments.mainArgument!, 'Unknown error (3)');
            }
          } else {
            return error2('Unknown error (1)');
          }
        } else {
          return error2('Unknown error (2)');
        }
      default:
        var settingsUri = Uri.parse(settings.name!);
        var path = settingsUri.path;
        var parameters = settingsUri.queryParameters;
        return getRoute(path, parameters);
    }
    return error2('No route defined for ${settings.name}!');
  }

  Route<dynamic> getRoute(String path, Map<String, dynamic>? parameters) {
    final pagePath = path.split('/');
    if (pagePath.length == 2) {
      final appId = pagePath[0];
      final pageId = pagePath[1];
      return pageRouteBuilderWithAppId(accessBloc.state, appId,
          pageId: pageId,
          parameters: parameters,
          page: Registry.registry()!
              .page(appId: appId, pageId: pageId, parameters: parameters));
    } else {
      return error2('No route defined for $path');
    }
  }

  PageRouteBuilder error(String path, String error) {
    final appId = path;
    return pageRouteBuilderWithAppId(accessBloc.state, appId,
        page: Registry.registry()!.error(appId: appId, error: error));
  }

  static PageRouteBuilder error2(String error) {
    return FadeRoute(
        name: 'error',
        page: Scaffold(body: Center(child: Text(error))),
        milliseconds: 1000);
  }

  static Future<void> navigateTo(BuildContext context, ActionModel action,
      {Map<String, dynamic>? parameters}) async {
    if (await action.hasAccess(context)) {
      if (action is FunctionToRun) {
        action.actionToRun();
      } else if (action is GotoPage) {
        BlocProvider.of<AccessBloc>(context).add(
            GotoPageEvent(action.app, action.pageID, parameters: parameters));
      } else if (action is OpenDialog) {
        await Registry.registry()!.openDialog(context,
            app: action.app, id: action.dialogID, parameters: parameters);
        // NAVIGATION-USING-BLOC
        // We should be using this instead: BlocProvider.of<AccessBloc>(context).add(OpenDialogEvent(action.dialogID, parameters: parameters));
      } else if (action is SwitchApp) {
        BlocProvider.of<AccessBloc>(context)
            .add(SwitchAppWithIDEvent(appId: action.toAppID, goHome: true));
      } else if (action is InternalAction) {
        switch (action.internalActionEnum) {
          case InternalActionEnum.login:
            openLoginWidget(context, action.app);
            break;
          case InternalActionEnum.logout:
            BlocProvider.of<AccessBloc>(context)
                .add(LogoutEvent(app: action.app));
            break;
          case InternalActionEnum.goHome:
            BlocProvider.of<AccessBloc>(context).add(GoHome(app: action.app));
            break;
          default:
            return;
        }
      } else {
        for (var i = 0; i < _registeredActionHandlers.length; i++) {
          _registeredActionHandlers[i]
              .navigateTo(context, action, parameters: parameters);
        }
      }
    } else {
      // return Text("no access");
      return;
    }
  }

  static AccessEvent? translate(ActionModel action,
      {Map<String, dynamic>? parameters}) {
    if (action is GotoPage) {
      return GotoPageEvent(action.app, action.pageID, parameters: parameters);
    } else if (action is OpenDialog) {
    } else if (action is SwitchApp) {
      return SwitchAppWithIDEvent(appId: action.toAppID, goHome: true);
    } else if (action is InternalAction) {
      switch (action.internalActionEnum) {
        case InternalActionEnum.login:
          return LoginEvent(
            app: action.app,
            loginType: LoginType.googleLogin,
          );
        case InternalActionEnum.logout:
          return LogoutEvent(app: action.app);
        case InternalActionEnum.goHome:
          return GoHome(app: action.app);
        default:
          return null;
      }
    }
    return null;
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

PageRouteBuilder pageRouteBuilderWithAppId(AccessState state, String appId,
    {String? pageId, Map<String, dynamic>? parameters, required Widget page}) {
  var name = getName(appId, pageId);
  if (state is AccessDetermined) {
    var app = state.getApp(appId);
    if (app != null) {
      return pageRoute(app, name, parameters, page);
    }
  }
  return FadeRoute(
      name: name, parameters: parameters, page: page, milliseconds: 1000);
}
