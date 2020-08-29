/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/cross_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eliud_core/tools/registry.dart';

import 'internal_component.dart';


typedef Changed(String value);

class CrossComponent extends StatefulWidget {
  final String extension;
  String value;
  final Changed trigger;

  CrossComponent({this.extension, this.value, this.trigger});

  @override
  State<StatefulWidget> createState() {
    return new CrossComponentState();
  }
}

class CrossComponentState extends State<CrossComponent> {

  CrossComponentState();

  @override
  Widget build(BuildContext context) {
    if ((widget.extension == null) || (widget.extension == ""))
      return Container(
        color: Colors.white
      );
    if (widget.extension == "internalWidgets") {
      var dropDownItems = Registry.registry().allInternalComponents()
          .map((widgetName) => new DropdownMenuItem(value: widgetName, child: new Text(widgetName)))
          .toList();

      String choice;
      if (Registry.registry().allInternalComponents().indexWhere((widgetName) => (widgetName == widget.value)) >= 0)
        choice = widget.value;

      return Center(child: new DropdownButton(
          value: choice,
          items: dropDownItems,
          hint: Text("Select internal widget"),
          onChanged: widget.trigger));
    } else {
      Widget selection = DropdownButtonComponentFactory().createNew(
          id: widget.extension, value: widget.value, trigger: widget.trigger);
      if (selection == null) {
        widget.value = null;
        widget.trigger(null);
        return Text("No selection available");
      }
      else return selection;
    }
  }
}


