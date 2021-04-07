import 'dart:collection';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/dialog_component.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:eliud_core/tools/widgets/message_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/components/page_component.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';

/*
 * Global registry with components
 */

class Registry {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Map<String, ComponentDropDown> componentDropDownSupporters = HashMap();

  final Map<String, List<String>> _allInternalComponents = HashMap();

  List<String>? allInternalComponents(String pluginName) =>
      _allInternalComponents[pluginName];

  void addInternalComponents(String pluginName, List<String> list) {
    _allInternalComponents[pluginName] = list;
  }

  final Map<String?, ComponentConstructor?> _registryMap = HashMap();

  static Registry? _instance;

  Map<String?, ComponentConstructor?> registryMap() => _registryMap;

  Registry._internal() {
  }

  static Registry? registry() {
    _instance ??= Registry._internal();

    return _instance;
  }

  Widget? page({String? id, Map<String, Object>? parameters}) {
    PageComponent? returnThis;
    try {
      returnThis = PageComponent(
        navigatorKey: navigatorKey,
        pageID: id,
        parameters: parameters,
      );
    } catch (_) {}
    if (returnThis != null) return returnThis;
    return _missingPage();
  }

  Future<void> openDialog(BuildContext context,
      {String? id, Map<String, Object>? parameters}) async {
    var appId = AccessBloc.appId(context);
    var dialog = await dialogRepository(appId: appId)!.get(id);
    if (dialog != null) {
      DialogStatefulWidgetHelper.openIt(context, DialogComponent(dialog: dialog, parameters: parameters));
    } else {
      DialogStatefulWidgetHelper.openIt(context, MessageDialog(title: 'Error', message: 'Widget with id $id not found in app $appId', yesFunction: () => Navigator.of(context).pop()));
    }
  }

  void snackbar(
      String text, {
        String? snackbarActionLabel,
        Function()? action,
      }) {
    final snackBar = SnackBar(
      content: Text(text),
      action: snackbarActionLabel == null ? null : SnackBarAction(
          label: snackbarActionLabel,
          onPressed: () {
            if (action != null) action();
          }),
    );
    rootScaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  Widget application({String? id, bool? asPlaystore}) {
    print("application");
    var navigatorBloc = NavigatorBloc(navigatorKey: navigatorKey);
    print("application 2");
    var accessBloc = AccessBloc(navigatorBloc)..add(InitApp(id, asPlaystore));
    print("application 3");
    var blocProviders = <BlocProvider>[];
    blocProviders
        .add(BlocProvider<AccessBloc>(create: (context) => accessBloc));
    print("application 4");
    blocProviders
        .add(BlocProvider<NavigatorBloc>(create: (context) => navigatorBloc) as BlocProvider<BlocBase<Object>>);
    print("application 5");
    GlobalData.registeredPackages.forEach((element) {
      var provider = element.createMainBloc(navigatorBloc, accessBloc);
      if (provider != null) {
        blocProviders.add(provider);
      }
    });
    print("application 6");
    return MultiBlocProvider(
        providers: blocProviders,
        child: BlocBuilder<AccessBloc, AccessState>(builder: (context, state) {
          if (state is AppLoaded) {
            print("AppLoaded");
            return BlocBuilder<AccessBloc, AccessState>(
                builder: (accessContext, accessState) {
              if (accessState is UndeterminedAccessState) {
                return Center(
                  child: DelayedCircularProgressIndicator(),
                );
              } else if (accessState is AppLoaded) {
                if (accessState.app == null) {
                  return AlertWidget(
                      title: 'Error', content: 'No access defined');
                } else {
                  var app = accessState.app;
                  var router = eliudrouter.Router(AccessBloc.getBloc(context));
                  ThemeData? darkTheme;
                  if ((app.darkOrLight != null) &&
                      (app.darkOrLight == DarkOrLight.Dark)) {
                    darkTheme = ThemeData.dark();
                  }
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    navigatorKey: navigatorKey,
                    scaffoldMessengerKey: rootScaffoldMessengerKey,
                    initialRoute: eliudrouter.Router.homeRoute,
                    onGenerateRoute: router.generateRoute,
                    darkTheme: darkTheme,
                    onUnknownRoute: (RouteSettings setting) {
                      return pageRouteBuilder(accessState.app,
                          page: AlertWidget(
                              title: 'Error', content: 'Page not found'));
                    },
                    title: app.title ?? 'No title',
                  );
                }
              } else {
                return AlertWidget(title: 'Error', content: 'Unexpected state');
              }
            });
          } else if (state is AppError) {
            print("AppError");
            print(state.message);
            return AlertWidget(title: 'Error', content: state.message);
          } else {
            print("Center");
            return Center(
                child: SizedBox(
                    width: 30,
                    height: 30,
                    child: DelayedCircularProgressIndicator()));
          }
        }));
  }

  Widget component(String componentName, String id, {Map<String, Object>? parameters}) {
    Widget? returnThis;
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
    return Text('Missing component with name $componentName');
  }

  Widget? _missingPage() {
    try {
      return Text('Page not available');
    } catch (_) {
      return null;
    }
  }

  void register(
      {String? componentName, ComponentConstructor? componentConstructor}) {
    _registryMap[componentName] = componentConstructor;
  }

  void addDropDownSupporter(String componentId, ComponentDropDown support) {
    componentDropDownSupporters[componentId] = support;
  }

  ComponentDropDown? getSupportingDropDown(String componentId) {
    return componentDropDownSupporters[componentId];
  }
}
