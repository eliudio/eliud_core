import 'dart:collection';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/components/dialog_component.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/conditions_simple_model.dart';
import 'package:eliud_core/package/packages.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/components/page_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';

import 'access/bloc/access_state.dart';

/*
 * Global registry with components
 */

class Registry {
  final GlobalKey _appKey = GlobalKey();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Map<String, ComponentDropDown> componentDropDownSupporters = HashMap();

  final Map<String, List<String>> _allInternalComponents = HashMap();

  // Map Plugin-Name => List ComponentSpec
  final Map<String, List<ComponentSpec>> _allComponentSpecs = HashMap();

  Map<String, List<String>> internalComponents() => _allInternalComponents;

  /*
  List<PluginWithComponents> retrievePluginsWithComponents() =>
      _allInternalComponents.entries.map((entry) => PluginWithComponents(entry.key, _components(entry.value))).toList();

  List<PluginComponent> _components(List<String> values) {
    List<PluginComponent> theList = [];
    values.forEach((componentName) {
      var component = _registryMap[componentName];
      if (component != null) {
        theList.add(PluginComponent(componentName, component));
      }
    });
    return theList;
  }*/

  List<String>? allInternalComponents(String pluginName) =>
      _allInternalComponents[pluginName];

  void addInternalComponents(String pluginName, List<String> list) {
    _allInternalComponents[pluginName] = list;
  }

  void addComponentSpec(String pluginName, List<ComponentSpec> specs) {
    _allComponentSpecs[pluginName] = specs;
  }

  final Map<String?, ComponentConstructor?> _registryMap = HashMap();
/*
  final Map<String, ComponentWidgetWrapper> _componentWidgetWrappers =
      HashMap();
*/

  static Registry? _instance;

  Map<String?, ComponentConstructor?> registryMap() => _registryMap;
  Map<String, List<ComponentSpec>> componentSpecMap() => _allComponentSpecs;

  ComponentSpec? getComponentSpecs(String name) {
    for (var componentSpec in _allComponentSpecs.values) {
      for (var entry in componentSpec) {
        if (entry.name == name) return entry;
      }
    }
    return null;
  }

  Registry._internal();

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
      openWidgetDialog(context,
          child: DialogComponent(
              dialog: dialog,
              parameters: parameters,
              includeHeading: dialog.includeHeading));
    } else {
      openErrorDialog(context,
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

    String? initialFragment;
    if (kIsWeb) {
      if (Uri.base.hasFragment) {
        initialFragment = Uri.base.fragment;
      }
    }

    return FutureBuilder<AppModel?>(
        future: getApp(appId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var app = snapshot.data!;
            var initialRoute =
                initialFragment ?? '$appId/' + app.homePages!.homePagePublic!;
            return MultiBlocProvider(
                providers: blocProviders,
                child: BlocBuilder<NavigatorBloc, TheNavigatorState>(
                    builder: (context, state) {
                  return Decorations.instance().createDecoratedApp(
                      context,
                      _appKey,
                      () => StyleRegistry.registry()
                          .styleWithContext(context)
                          .frontEndStyle()
                          .appStyle()
                          .app(
                            key: _appKey,
                            navigatorKey: navigatorKey,
                            scaffoldMessengerKey: rootScaffoldMessengerKey,
                            initialRoute: initialRoute,
                            onGenerateRoute: eliudrouter.Router.generateRoute,
                            onUnknownRoute: (RouteSettings setting) {
                              return pageRouteBuilderWithAppId(appId,
                                  page: AlertWidget(
                                      title: 'Error',
                                      content: 'Page not found'));
                            },
                            title: app.title ?? 'No title',
                          ),
                      app)();
                }));
          } else {
            return MaterialApp(
                home: Scaffold(
              backgroundColor: Colors.black,
              body: Text('App loading...'),
            ));
          }
        });
  }

  Widget component(AppLoaded appLoaded, String componentName, String id,
      {Map<String, dynamic>? parameters, Key? key}) {
    Widget? returnThis;
    try {
      var componentConstructor = _registryMap[componentName];
      if (componentConstructor != null) {
        return FutureBuilder<dynamic>(
            future: componentConstructor.getModel(
                appId: appLoaded.app.documentID!, id: id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var model = snapshot.data;
                var hasAccess = componentAccessValidation(
                    appLoaded, componentName, id, model);
                if (hasAccess) {
                  return componentConstructor.createNew(
                          key: key, id: id, parameters: parameters) ??
                      _missingComponent(componentName);
                } else {
                  return Container();
                }
              } else {
                return Container();
//                return progressIndicator(context);
              }
            });
      } else {
        return Container();
      }
    } catch (_) {}
    return _missingComponent(componentName);
  }

  Widget _missingComponent(String componentName) {
    return Text('Missing component with name $componentName');
  }

  bool componentAccessValidation(
      AccessState accessState, String component, String id, dynamic model) {
    try {
      // if model is not found then no access for this member
      if (model == null) {
        print('$component with id $id not found');
        return false;
      }

      // if no conditions set then access for this member
      if (model.conditions == null) return true;
      if (model.conditions!.privilegeLevelRequired == null) return true;

      // if access is not set and blocked member then no access for this member
      if ((accessState is LoggedIn) && (accessState.blocked)) return false;

      // if access is set to no priv required then access for this member
      if (model.conditions!.privilegeLevelRequired ==
          PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple) return true;

      // Given some privilege is required and access is not set then no access for this member
      if (!(accessState is LoggedIn)) return false;

      // If sufficient privilege set then access for this member
      if (model.conditions!.privilegeLevelRequired!.index <=
          accessState.privilegeLevel.index) return true;

      // If no sufficient privileges then no access for this member
      return false;
    } catch (_) {
      print('Exception whilst validating access to $component with id $id');
      return false;
    }
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

/*
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
*/

  void addDropDownSupporter(String componentId, ComponentDropDown support) {
    componentDropDownSupporters[componentId] = support;
  }

  ComponentDropDown? getSupportingDropDown(String componentId) {
    return componentDropDownSupporters[componentId];
  }
}
