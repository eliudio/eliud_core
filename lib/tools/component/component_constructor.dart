import 'package:eliud_core/core/tools/component_info.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/model/internal_component.dart';
import 'package:flutter/cupertino.dart';

// base for all ComponentsConstructors and used to create a component of that kind
abstract class ComponentConstructor {
  Widget? createNew({Key? key, required String appId, required String id, Map<String, dynamic>? parameters});
  dynamic getModel({required String appId, required String id});
}

// interface for the DropDownFactories to be able to find out if a factory supports a specific component with id specified.
abstract class ComponentDropDown extends ComponentConstructor {
  bool supports(String id);

  @override
  Widget? createNew({Key? key, required String appId, required String id, Map<String, dynamic>? parameters, String? value, DropdownButtonChanged? trigger, bool? optional});
}

// this WidgetWrapper can be registered onto the registry and can be used as a widget wrapper for a page
// the page will wrap all it's components inside this widget. This can for example be of use when
// you would want to use 1 bloc for several components on a page, preventing a bloc-delay for each component
abstract class ComponentWidgetWrapper {
  Widget wrapWidget(BuildContext context, ComponentInfo componentInfo);
}
