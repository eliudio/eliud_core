import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:eliud_core/core/components/application_component.dart';
import 'package:eliud_core/core/components/page_component.dart';

import 'package:eliud_core/tools/component_constructor.dart';


/*
 * Global registry with components
 */

class Registry {
  List<String> _allInternalComponents = [];

  List<String> allInternalComponents() => _allInternalComponents;

  void addInternalComponents(List<String> list) {
    _allInternalComponents.addAll(list);
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

  Widget application({String id}) {
    return _applicationComponentConstructor.createNew(id: id);
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
    return _missingComponent();
  }

  Widget _missingComponent() {
    try {
      return Image(
          image: AssetImage('assets/images/component_not_available.png'));
    } catch (_) {
      return null;
    }
  }

  Widget _missingPage() {
    try {
      return Image(image: AssetImage('assets/images/page_not_available.png'));
    } catch (_) {
      return null;
    }
  }

  void register(
      {String componentName, ComponentConstructor componentConstructor}) {
    _registryMap[componentName] = componentConstructor;
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


