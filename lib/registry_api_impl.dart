import 'package:eliud_core_model/apis/registryapi/registry_api.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/tools/component/component_constructor.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'package:flutter/cupertino.dart';

import 'core/registry.dart';

class RegistryApiImpl extends RegistryApi {
  @override
  ComponentDropDown? getSupportingDropDown(String componentId) {
    return Registry.registry()!.getSupportingDropDown(componentId);
  }

  @override
  List<String>? allInternalComponents(String pluginName) {
    List<String>? returnMe =
      Registry.registry()!.allInternalComponents(pluginName);
    return returnMe;
  }

  @override
  Widget component(
      BuildContext context, AppModel app, String componentName, String id,
      {Map<String, dynamic>? parameters, Key? key}) {
    return Registry.registry()!.component(context, app, componentName, id,
        key: key, parameters: parameters);
  }

  @override
  List<String> getExtensions() {
    return Registry.registry()!.getExtensions();
  }

  @override
  ComponentSpec? getComponentSpecs(String name) {
    return Registry.registry()!.getComponentSpecs(name);
  }

  @override
  void addInternalComponents(String pluginName, List<String> list) {
    Registry.registry()!.addInternalComponents(pluginName, list);
  }

  @override
  void register(
      {String? componentName, ComponentConstructor? componentConstructor}) {
    Registry.registry()!.register(
        componentName: componentName,
        componentConstructor: componentConstructor);
  }

  @override
  void addDropDownSupporter(String componentId, ComponentDropDown support) {
    Registry.registry()!.addDropDownSupporter(componentId, support);
  }

  @override
  void addComponentSpec(
      String pluginName, String pluginFriendlyName, List<ComponentSpec> specs) {
    Registry.registry()!
        .addComponentSpec(pluginName, pluginFriendlyName, specs);
  }

  @override
  void registerRetrieveRepository(
      String pluginName, String componentId, RetrieveRepository repository) {
    Registry.registry()!
        .registerRetrieveRepository(pluginName, componentId, repository);
  }

  @override
  Widget application({required AppModel app, required bool asPlaystore}) {
    return Registry.registry()!.application(app: app, asPlaystore: asPlaystore);
  }
}
