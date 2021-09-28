import 'package:flutter/material.dart';
import 'component_constructor.dart';

class ComponentSpec {
  final String name;
  final ComponentConstructor constructor;
  final ComponentSelector selector;
  final ComponentEditor editor;

  ComponentSpec(this.name, this.constructor, this.selector, this.editor);
}

typedef SelectComponent(String componentId);

abstract class ComponentSelector {
  Widget createSelectWidget(BuildContext context, double height, SelectComponent selected);
}

abstract class ComponentEditor {
  void updateComponent(model);
}
