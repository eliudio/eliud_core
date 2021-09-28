import 'package:flutter/material.dart';
import 'component_constructor.dart';

class ComponentSpec {
  final String name;
  final ComponentConstructor constructor;
  final ComponentSelector selector;
  final ComponentEditorConstructor editor;

  ComponentSpec(this.name, this.constructor, this.selector, this.editor);
}

typedef SelectComponent(String componentId);

abstract class ComponentSelector {
  Widget createSelectWidget(BuildContext context, double height, SelectComponent selected, editor);
}

abstract class ComponentEditorConstructor {
  void updateComponent(BuildContext context, model);
  void createNewComponent(BuildContext context, );
}
