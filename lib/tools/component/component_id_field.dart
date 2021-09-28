import 'package:eliud_core/core/registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef Changed = Function(String? value);

class ComponentIdField extends StatefulWidget {
  final String? componentName;
  String? value;
  final Changed? trigger;

  ComponentIdField({this.componentName, this.value, this.trigger});

  @override
  State<StatefulWidget> createState() {
    return ComponentIdFieldState();
  }
}

class ComponentIdFieldState extends State<ComponentIdField> {

  ComponentIdFieldState();

  @override
  Widget build(BuildContext context) {
    String? componentName = widget.componentName;
    if ((componentName == null) || (componentName == ''))
      return Text("No componentName specified");
    if (componentName.endsWith('internalWidgets')) {
      var packageName = componentName.substring(0, componentName.length - 16);
      var internalComponents = Registry.registry()!.allInternalComponents(packageName);
      if ((internalComponents == null) || (internalComponents.length == 0)) {
        return Text("No internal components available for $packageName");
      } else {
        var dropDownItems = internalComponents
            .map((widgetName) =>
            DropdownMenuItem(value: widgetName, child: Text(widgetName)))
            .toList();

        String? choice;
        if (internalComponents.indexWhere((widgetName) =>
        (widgetName == widget.value)) >= 0) {
          choice = widget.value;
        }

        return Center(child: DropdownButton(
            value: choice,
            items: dropDownItems,
            hint: Text('Select internal widget'),
            onChanged: widget.trigger));
      }
    } else {
      var componentDropDown = Registry.registry()!.getSupportingDropDown(componentName);
      if (componentDropDown != null) {
        var selection = componentDropDown.createNew(
            id: componentName,
            value: widget.value,
            trigger: widget.trigger);
        if (selection == null) {
          widget.value = null;
          widget.trigger!(null);
          return Text("No selection available");
        }
        else
          return selection;
      } else {
        return Text("No supporting dropDown for component with name $componentName available");
      }
    }
  }
}


