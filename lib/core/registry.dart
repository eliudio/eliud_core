import 'dart:collection';
import 'package:eliud_core/core/components/dialog_component.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/conditions_simple_model.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
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

import 'blocs/access/access_bloc.dart';
import 'blocs/access/access_event.dart';
import 'blocs/access/state/access_determined.dart';
import 'blocs/access/state/access_state.dart';
import 'blocs/access/state/logged_in.dart';

/*
 * Global registry with components
 */

class Registry {
  final GlobalKey _appKey = GlobalKey();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Map<String, ComponentDropDown> componentDropDownSupporters = HashMap();
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final Map<String, List<String>> _allInternalComponents = HashMap();

  // Map Plugin-Name => List ComponentSpec
  final Map<String, List<ComponentSpec>> _allComponentSpecs = HashMap();

  Map<String, List<String>> internalComponents() => _allInternalComponents;

  List<String>? allInternalComponents(String pluginName) =>
      _allInternalComponents[pluginName];

  void addInternalComponents(String pluginName, List<String> list) {
    _allInternalComponents[pluginName] = list;
  }

  void addComponentSpec(String pluginName, List<ComponentSpec> specs) {
    _allComponentSpecs[pluginName] = specs;
  }

  final Map<String?, ComponentConstructor?> _registryMap = HashMap();

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

  Widget page(
          {required String appId,
          required String pageId,
          Map<String, dynamic>? parameters}) =>
      PageComponent(appId: appId, pageId: pageId, parameters: parameters);

  Future<void> openDialog(BuildContext context,
      {required String id, Map<String, dynamic>? parameters}) async {
    var appId = AccessBloc.currentAppId(context);
    openWidgetDialog(context, appId + '/' + id,
        child: DialogComponent(
            appId: appId, dialogId: id, parameters: parameters));
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

  Widget application({required AppModel app, required bool asPlaystore}) {
    String? initialFragment;
    if (kIsWeb) {
      if (Uri.base.hasFragment) {
        initialFragment = Uri.base.fragment;
      }
    }

    var appId = app.documentID!;

    var initialRoute =
        initialFragment ?? '$appId/' + app.homePages!.homePagePublic!;

    return BlocProvider<AccessBloc>(
        create: (context) => AccessBloc(navigatorKey)
          ..add(AccessInitEvent(app, asPlaystore ? app : null)),
        child: MaterialApp(
          key: _appKey,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          initialRoute: initialRoute,
          onGenerateRoute: eliudrouter.Router.generateRoute,
          onUnknownRoute: (RouteSettings setting) {
            return pageRouteBuilderWithAppId(appId,
                page: AlertWidget(title: 'Error', content: 'Page not found'));
          },
          title: 'No title',
        ));

/*
    return BlocProvider<AccessBloc>(
        create: (context) => AccessBloc(navigatorKey)..add(AccessInit(app)),
        child: BlocListener<AccessBloc, AccessState>(
            listener: (BuildContext context, AccessState accessState) {
          if (accessState is AccessDetermined) {
            var currentContext = accessState.currentContext;
            if (currentContext is PageContext) {
              navigatorKey.currentState!.pushNamed(eliudrouter.Router.pageRoute,
                  arguments: eliudrouter.Arguments(
                      appId + '/' + currentContext.page.documentID!,
                      currentContext.parameters));
            } else if (currentContext is DialogContext) {
              openDialog(context,
                  id: currentContext.dialog.documentID!,
                  parameters: currentContext.parameters);
            }
          }
        }, child: BlocBuilder<AccessBloc, AccessState>(
                builder: (context, accessState) {
          if (accessState is AccessDetermined) {
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
                                title: 'Error', content: 'Page not found'));
                      },
                      title: app.title ?? 'No title',
                    ),
                app)();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        })));
*/
  }

  Widget component(BuildContext context,
      /*AccessDetermined accessDetermined, */ String componentName, String id,
      {Map<String, dynamic>? parameters, Key? key}) {
    Widget? returnThis;
    try {
      var componentConstructor = _registryMap[componentName];
      if (componentConstructor != null) {
        return BlocBuilder(
            bloc: BlocProvider.of<AccessBloc>(context),
            builder: (BuildContext context, accessState) {
              if (accessState is AccessDetermined) {
                var appId = accessState.currentAppId(context);
                return FutureBuilder<dynamic>(
                    future: componentConstructor.getModel(
                        appId: appId, id: id),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var model = snapshot.data;
                        var hasAccess = componentAccessValidation(
                            context, accessState, componentName, id, model);
                        if (hasAccess) {
                          return componentConstructor.createNew(
                                  key: key, appId: appId, id: id, parameters: parameters) ??
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
                return Center(child: CircularProgressIndicator());
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

  bool componentAccessValidation(BuildContext context, AccessDetermined accessDetermined,
      String component, String id, dynamic model) {
    try {
      // if model is not found then no access for this member
      if (model == null) {
        print('$component with id $id not found');
        return false;
      }

      // if no conditions set then access for this member
      if (model.conditions == null) return true;
      if (model.conditions!.privilegeLevelRequired == null) return true;

      // if access is set to no priv required then access for this member, i.e. blocked members can see public pages
      if (model.conditions!.privilegeLevelRequired ==
          PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple) return true;

      // if access is not set and blocked member then no access for this member
      if ((accessDetermined is LoggedIn) &&
          (accessDetermined.isCurrentAppBlocked(context))) return false;

      // Given some privilege is required and access is not set then no access for this member
      if (!(accessDetermined is LoggedIn)) return false;

      // If sufficient privilege set then access for this member
      if (model.conditions!.privilegeLevelRequired!.index <=
          accessDetermined.getPrivilegeLevelCurrentApp(context).index) return true;

      // If no sufficient privileges then no access for this member
      return false;
    } catch (_) {
      print('Exception whilst validating access to $component with id $id');
      return false;
    }
  }

  Widget _missingPage() {
    return Text('Page not available');
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
