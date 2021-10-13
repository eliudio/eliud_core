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
  // update the component with the component model
  void updateComponent(BuildContext context, model, EditorFeedback feedback);

  // update the component with component id
  void updateComponentWithID(BuildContext context, String id, EditorFeedback feedback);
  void createNewComponent(BuildContext context, EditorFeedback feedback);
}

typedef void EditorFeedback(bool status); // true is ok

