import 'dart:collection';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/dialog_component.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/packages.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/router_builders.dart';
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
  final Map<String, ComponentWidgetWrapper> _componentWidgetWrappers =
      HashMap();

  static Registry? _instance;

  Map<String?, ComponentConstructor?> registryMap() => _registryMap;

  Registry._internal() {}

  static Registry? registry() {
    _instance ??= Registry._internal();

    return _instance;
  }

  Widget? page(
      {required String appId,
      required String pageId,
      Map<String, dynamic>? parameters}) {
    PageComponent? returnThis;
    try {
      returnThis = PageComponent(
        navigatorKey: navigatorKey,
        appId: appId,
        pageId: pageId,
        parameters: parameters,
      );
    } catch (_) {}
    if (returnThis != null) return returnThis;
    return _missingPage();
  }

  Future<void> openDialog(BuildContext context,
      {String? id, Map<String, dynamic>? parameters}) async {
    var appId = AccessBloc.appId(context);
    var dialog = await dialogRepository(appId: appId)!.get(id);
    if (dialog != null) {
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .dialogStyle()
          .openWidgetDialog(context,
              child: DialogComponent(dialog: dialog, parameters: parameters));
    } else {
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .dialogStyle()
          .openErrorDialog(context,
              title: 'Error',
              errorMessage: 'Widget with id $id not found in app $appId',
              closeLabel: 'Close');
    }
  }

  void snackbar(
    String text, {
    String? snackbarActionLabel,
    Function()? action,
  }) {
    final snackBar = SnackBar(
      content: Text(text),
      action: snackbarActionLabel == null
          ? null
          : SnackBarAction(
              label: snackbarActionLabel,
              onPressed: () {
                if (action != null) action();
              }),
    );
    rootScaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }

  Future<AppModel?> getApp(String appId) async {
    var app = await AbstractMainRepositorySingleton.singleton
        .appRepository()!
        .get(appId);
    if (app == null) {
      throw Exception('App with id $appId does not exist');
    }
    return app;
  }

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  Widget application({required String appId, required bool asPlaystore}) {
    var navigatorBloc = NavigatorBloc(navigatorKey: navigatorKey);
    var accessBloc = AccessBloc(navigatorBloc)
      ..add(InitApp(appId, asPlaystore));
    var blocProviders = <BlocProvider>[
      BlocProvider<AccessBloc>(create: (context) => accessBloc),
      BlocProvider<NavigatorBloc>(create: (context) => navigatorBloc)
    ];
    Packages.registeredPackages.forEach((element) {
      var provider = element.createMainBloc(navigatorBloc, accessBloc);
      if (provider != null) {
        blocProviders.add(provider);
      }
    });

    return FutureBuilder<AppModel?>(
        future: getApp(appId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var app = snapshot.data;
            var initialRoute =
                '$appId/' + app!.homePages!.homePagePublic!;
            return MultiBlocProvider(
                providers: blocProviders,
                child: BlocBuilder<NavigatorBloc, TheNavigatorState>(
                    builder: (context, state) {
                  return StyleRegistry.registry()
                      .styleWithContext(context)
                      .frontEndStyle()
                      .appStyle()
                      .app(
                        navigatorKey: navigatorKey,
                        scaffoldMessengerKey: rootScaffoldMessengerKey,
                        initialRoute: initialRoute,
                        onGenerateRoute: eliudrouter.Router.generateRoute,
                        onUnknownRoute: (RouteSettings setting) {
                          return pageRouteBuilderWithAppId(appId,
                              page: AlertWidget(
                                  title: 'Error', content: 'Page not found'));
                        },
                        title: app!.title ?? 'No title',
                      );
                }));
          } else {
            return MaterialApp(
                home: Scaffold(
                  backgroundColor: Colors.black,
                  body: Text(''),
                )
            );
          }
        });
  }

  Widget component(String componentName, String id,
      {Map<String, dynamic>? parameters}) {
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

  void registerPageComponentsBloc(
      String blocName, ComponentWidgetWrapper wrapper) {
    _componentWidgetWrappers[blocName] = wrapper;
  }

  Widget? wrapWidgetInBloc(
      String wrapperName, BuildContext context, ComponentInfo componentInfo) {
    var wrapper = _componentWidgetWrappers[wrapperName];
    if (wrapper != null) {
      return wrapper.wrapWidget(context, componentInfo);
    } else {
      print(
          "Can't find the wrapper with wrapperName $wrapperName. Did you register it from your package using registerPageComponentsBloc?");
      return null;
    }
  }

  void addDropDownSupporter(String componentId, ComponentDropDown support) {
    componentDropDownSupporters[componentId] = support;
  }

  ComponentDropDown? getSupportingDropDown(String componentId) {
    return componentDropDownSupporters[componentId];
  }
}
