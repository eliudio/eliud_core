import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/tools/registry.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/navigation_event.dart';

class Arguments {
  final String mainArgument;
  final Map<String, String> parameters;

  Arguments(this.mainArgument, this.parameters);
}

class Router {
  static const String homeRoute = '/';
  static const String pageRoute = '/page';
  static const String justASecond = '/justASecond';

  AppModel app;

  Router();

  Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint('Router::generateRoute($settings.name)');
    Arguments arguments;
    if (settings.arguments is Arguments) {
      arguments = settings.arguments;
    }
    switch (settings.name) {
      case '':
        // in flutterweb, the initialRoute is "", not "/"
        return pageRouteBuilder(page: Registry.registry().page(id: GlobalData.homePage()));
      case homeRoute:
        return pageRouteBuilder(page: Registry.registry().page(id: GlobalData.homePage()));
      case justASecond:
        return pageRouteBuilder(page: justASecondWidget(arguments == null ? null : arguments.mainArgument));
      case pageRoute:
        return pageRouteBuilder(page: Registry.registry().page(id: arguments == null ? null : arguments.mainArgument, parameters: arguments == null ? null : arguments.parameters));
      default:
            return pageRouteBuilder(page: Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  final List<Color> _colors = [Colors.white, Colors.grey];
  final List<double> _stops = [0.0, 0.7];
  Widget justASecondWidget(String message) {
    return Material(
        type: MaterialType.transparency,
        child: Container(child: Center(
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
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                 child: Text(message, style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                  )),
              )
            ],
          )
      ),
    )));
  }

  static void navigateTo(BuildContext context, ActionModel action, { Map<String, String> parameters }) async {
    if (action is GotoPage) {
      BlocProvider.of<NavigatorBloc>(context).add(GoToPageEvent(action.pageID, parameters: parameters));
    } else if (action is SwitchApp) {
      var appId = action.appID;
      BlocProvider.of<NavigatorBloc>(context).add(JustASecond('Switching to $appId'));
      BlocProvider.of<AccessBloc>(context).add(SwitchAppEvent(appId));
    } else if (action is InternalAction) {
      switch (action.internalActionEnum) {
        case InternalActionEnum.Login:
          BlocProvider.of<AccessBloc>(context).add(LoginEvent());
          break;
        case InternalActionEnum.Logout:
          BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
          BlocProvider.of<NavigatorBloc>(context).add(GoHome());
          break;
        case InternalActionEnum.Flush:
          AbstractRepositorySingleton.singleton.flush();
          BlocProvider.of<NavigatorBloc>(context).add(GoHome());
          break;
        default:
          return null;
      }
    }
  }

  static void navigateToPage(NavigatorBloc bloc, ActionModel action, { Map<String, String> parameters }) async {
    if (action is GotoPage) {
      bloc.add(GoToPageEvent(action.pageID, parameters: parameters));
    } else {
      throw "I didn't expect this action type";
  }
  }
}
