import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../../core/base/repository_base.dart';
import 'component_constructor.dart';

typedef RepositoryBase<T, U> RetrieveRepository<T, U>({String? appId});

class ComponentSpec {
  final String name;
  final ComponentConstructor constructor;
  final ComponentSelector selector;
  final ComponentEditorConstructor editor;
  final RetrieveRepository retrieveRepository;

  ComponentSpec(this.name, this.constructor, this.selector, this.editor, this.retrieveRepository);
}

typedef SelectComponent(String componentId);

abstract class ComponentSelector {
  Widget createSelectWidget(BuildContext context, AppModel app, int privilegeLevel, double height, SelectComponent selected, editor);
}

abstract class ComponentEditorConstructor {
  // update the component with the component model
  void updateComponent(AppModel app, BuildContext context, model, EditorFeedback feedback);

  // update the component with component id
  void updateComponentWithID(AppModel app, BuildContext context, String id, EditorFeedback feedback);
  void createNewComponent(AppModel app, BuildContext context, EditorFeedback feedback);
}

typedef void EditorFeedback(bool status); // true is ok

