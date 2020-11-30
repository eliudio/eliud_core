import 'dart:collection';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/app/app_state.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/core/components/page_component.dart';

import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app/app_bloc.dart';
import '../core/app/app_event.dart';
import 'main_abstract_repository_singleton.dart';

/*
 * Global registry with components
 */

class Registry {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Map<String, ComponentDropDown> componentDropDownSupporters = HashMap();

  final Map<String, List<String>> _allInternalComponents = HashMap();

  List<String> allInternalComponents(String pluginName) =>
      _allInternalComponents[pluginName];

  void addInternalComponents(String pluginName, List<String> list) {
    _allInternalComponents[pluginName] = list;
  }

  final Map<String, ComponentConstructor> _registryMap = HashMap();
  PageComponentConstructor _pageComponentConstructor;

  static Registry _instance;

  Map<String, ComponentConstructor> registryMap() => _registryMap;

  Registry._internal() {
    _init();
  }

  static Registry registry() {
    _instance ??= Registry._internal();

    return _instance;
  }

  Widget page({String id, Map<String, String> parameters}) {
    Widget returnThis;
    try {
      returnThis =
          _pageComponentConstructor.createNew(id: id, parameters: parameters);
    } catch (_) {}
    if (returnThis != null) return returnThis;
    return _missingPage();
  }

  Widget application({ String id, bool asPlaystore }) {
    var navigatorBloc = NavigatorBloc(navigatorKey: navigatorKey);
    var accessBloc = AccessBloc(navigatorBloc);
    var appBloc = AppBloc(navigatorBloc, accessBloc, asPlaystore ? id : null)..add(FetchApp(id: id));
    var blocProviders = <BlocProvider>[];
    blocProviders.add(BlocProvider<AccessBloc>(create: (context) => accessBloc));
    blocProviders.add(BlocProvider<AppBloc>(create: (context) => appBloc));
    blocProviders.add(BlocProvider<NavigatorBloc>(create: (context) => navigatorBloc));
    GlobalData.registeredPackages.forEach((element) {
      var provider = element.createMainBloc(navigatorBloc, appBloc, accessBloc);
      if (provider != null) {
        blocProviders.add(provider);
      }
    });
    return MultiBlocProvider(
        providers: blocProviders,
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is AppLoaded) {
            return BlocBuilder<AccessBloc, AccessState>(
                builder: (accessContext, accessState) {
                  if (accessState is UndeterminedAccessState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (accessState is AccessStateWithDetails) {
                    if (accessState.app == null) {
                      return AlertWidget(title: 'Error', content: 'No access defined');
                    } else {
                      var app = accessState.app;
                      var router = eliudrouter.Router(AppBloc.getBloc(context));
                      ThemeData darkTheme;
                      if ((app.darkOrLight != null) &&
                          (app.darkOrLight == DarkOrLight.Dark)) {
                        darkTheme = ThemeData.dark();
                      }

                      return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        navigatorKey: navigatorKey,
                        initialRoute: eliudrouter.Router.homeRoute,
                        onGenerateRoute: router.generateRoute,
                        darkTheme: darkTheme,
                        onUnknownRoute: (RouteSettings setting) {
                          return pageRouteBuilder(accessState.app,
                              page: AlertWidget(title: 'Error', content: 'Page not found'));
                        },
                        title: app.title ?? 'No title',
                      );
                    }
                  } else {
                    return AlertWidget(title: 'Error', content: 'Unexpected state');
                  }
                });
          } else if (state is AppError) {
            return AlertWidget(title: 'Error', content: state.message);
          } else {
            return CircularProgressIndicator();
          }
        }));
  }

  Widget component(
      {String componentName, String id, Map<String, String> parameters}) {
    Widget returnThis;
    try {
      var componentConstructor = _registryMap[componentName];
      if (componentConstructor != null) {
        returnThis =
            componentConstructor.createNew(id: id, parameters: parameters);
      }
    } catch (_) {}
    if (returnThis != null) return returnThis;
    return _missingComponent(componentName);
  }

  Widget _missingComponent(String componentName) {
    try {
      return Text('Missing component with name $componentName');
    } catch (_) {
      return null;
    }
  }

  Widget _missingPage() {
    try {
      return Text('Page not available');
    } catch (_) {
      return null;
    }
  }

  void register(
      {String componentName, ComponentConstructor componentConstructor}) {
    _registryMap[componentName] = componentConstructor;
  }

  void addDropDownSupporter(String componentId, ComponentDropDown support) {
    componentDropDownSupporters[componentId] = support;
  }

  ComponentDropDown getSupportingDropDown(String componentId) {
    return componentDropDownSupporters[componentId];
  }

  void initialize(
      {ComponentConstructor pageComponentConstructor,
      ComponentConstructor applicationComponentConstructor}) {
    _pageComponentConstructor = pageComponentConstructor;
  }

  void _init() {
    initialize(
      pageComponentConstructor:
          PageComponentConstructorDefault(navigatorKey: navigatorKey),
    );
  }
}
