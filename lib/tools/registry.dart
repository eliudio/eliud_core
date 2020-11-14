import 'dart:collection';
import 'package:eliud_core/core/app/app_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/internal_component.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/core/components/application_component.dart';
import 'package:eliud_core/core/components/page_component.dart';

import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app/app_bloc.dart';
import '../core/app/app_event.dart';


/*
 * Global registry with components
 */

class Registry {
  Map<String, ComponentDropDown> componentDropDownSupporters = HashMap();

  Map<String, List<String>> _allInternalComponents = HashMap();

  List<String> allInternalComponents(String pluginName) => _allInternalComponents[pluginName];

  void addInternalComponents(String pluginName, List<String> list) {
    _allInternalComponents[pluginName] = list;
  }

  final Map<String, ComponentConstructor> _registryMap = HashMap();
  PageComponentConstructor _pageComponentConstructor;
  ApplicationComponentConstructor _applicationComponentConstructor;

  static Registry _instance;
  
  Map<String, ComponentConstructor> registryMap() => _registryMap;

  Registry._internal() {
    _init();
  }

  static Registry registry() {
    _instance ??= Registry._internal();

    return _instance;
  }

  Widget page({String id, Map<String, String> parameters }) {
    Widget returnThis;
    try {
      returnThis = _pageComponentConstructor.createNew(id: id, parameters: parameters);
    } catch (_) {}
    if (returnThis != null) return returnThis;
    return _missingPage();
  }

  Widget application({String id, bool asPlaystore}) {
    return BlocProvider<AppBloc> (
      create: (context) => AppBloc()
        ..add(FetchApp(id: id, asPlaystore: asPlaystore)),
      child: getApp(id: id),
    );
  }

  Widget getApp({ String id }) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is AppLoaded) {
        return _applicationComponentConstructor.createNew(id: id);
      } else if (state is AppError) {
        return  AlertWidget(title: "Error", content: state.message);
      } else {
        return CircularProgressIndicator();
      }
    });
  }

  Widget component({String componentName, String id, Map<String, String> parameters}) {
    Widget returnThis;
    try {
      var componentConstructor = _registryMap[componentName];
      if (componentConstructor != null) {
        returnThis = componentConstructor.createNew(id: id, parameters: parameters);
      }
    } catch (_) {}
    if (returnThis != null) return returnThis;
    return _missingComponent(componentName);
  }

  Widget _missingComponent(String componentName) {
    try {
      return Text("Missing component with name $componentName");
    } catch (_) {
      return null;
    }
  }

  Widget _missingPage() {
    try {
      return Text("Page not available");
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
    _applicationComponentConstructor = applicationComponentConstructor;
  }

  void _init() {
    final navigatorKey = GlobalKey<NavigatorState>();
    initialize(
      pageComponentConstructor: PageComponentConstructorDefault(
          navigatorKey: navigatorKey),
      applicationComponentConstructor: ApplicationComponentConstructorDefault(
          navigatorKey: navigatorKey),
    );
  }
}


