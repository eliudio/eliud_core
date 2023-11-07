import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

import '../../style/frontend/has_button.dart';

typedef ComponentIdFieldChanged = Function(String? value, int? privilegeLevel);

class ComponentIdField extends StatefulWidget {
  final AppModel app;
  final String? componentName;
  final String? originalValue;
  final int? currentPrivilegeLevel;
  final ComponentIdFieldChanged? trigger;

  ComponentIdField(this.app,
      {this.componentName,
      this.originalValue,
      this.currentPrivilegeLevel,
      this.trigger});

  @override
  State<StatefulWidget> createState() {
    return ComponentIdFieldState(originalValue);
  }
}

class ComponentIdFieldState extends State<ComponentIdField> {
  String? value;
  ComponentIdFieldState(this.value);

  @override
  Widget build(BuildContext context) {
    var componentName = widget.componentName;
    if ((componentName == null) || (componentName == '')) {
      return Text('No componentName specified');
    } else {
      if (componentName.endsWith('internalWidgets')) {
        var packageName = componentName.substring(0, componentName.length - 16);
        var internalComponents =
            Registry.registry()!.allInternalComponents(packageName);
        if ((internalComponents == null) || (internalComponents.isEmpty)) {
          return Text("No internal components available for $packageName");
        } else {
          var dropDownItems = internalComponents
              .map((widgetName) =>
                  DropdownMenuItem(value: widgetName, child: Text(widgetName)))
              .toList();

          String? choice;
          if (internalComponents
                  .indexWhere((widgetName) => (widgetName == value)) >=
              0) {
            choice = value;
          }

          return dropdownButton<String>(widget.app, context,
              value: choice,
              items: dropDownItems,
              hint: text(widget.app, context, 'Select internal widget'),
              onChanged: (value) => widget.trigger!(
                  value.toString(), widget.currentPrivilegeLevel));
        }
      } else {
        var componentDropDown =
            Registry.registry()!.getSupportingDropDown(componentName);
        if (componentDropDown != null) {
          var selection = componentDropDown.createNew(
              app: widget.app,
              privilegeLevel: widget.currentPrivilegeLevel,
              id: componentName,
              value: value,
              trigger: widget.trigger);
          if (selection == null) {
            value = null;
            widget.trigger!(null, widget.currentPrivilegeLevel);
            return Text("No selection available");
          } else {
            return selection;
          }
        } else {
          return Text(
              "No supporting dropDown for component with name $componentName available");
        }
      }
    }
  }
}
