import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/widgets/action_specification_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

abstract class NewAppWizardInfoWithActionSpecification
    extends NewAppWizardInfo {
  final String wizardWidgetLabel;

  NewAppWizardInfoWithActionSpecification(
      super.newAppWizardName, super.displayName, this.wizardWidgetLabel);

  @override
  List<MenuItemModel>? getMenuItemsFor(String uniqueId, AppModel app,
      NewAppWizardParameters parameters, MenuType type) {
    if (parameters is ActionSpecificationParametersBase) {
      if (parameters.actionSpecifications.should(type)) {
        return getThoseMenuItems(uniqueId, app);
      }
    } else {
      throw Exception('Unexpected class for parameters: $parameters');
    }
    return null;
  }

  List<MenuItemModel>? getThoseMenuItems(String uniqueId, AppModel app);

  @override
  Widget wizardParametersWidget(
      AppModel app, BuildContext context, NewAppWizardParameters parameters) {
    if (parameters is ActionSpecificationParametersBase) {
      return ActionSpecificationWidget(
          app: app,
          actionSpecification: parameters.actionSpecifications,
          label: wizardWidgetLabel);
    } else {
      return text(app, context, 'Unexpected class for parameters: $parameters');
    }
  }

  @override
  AppModel updateApp(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel adjustMe,
  ) =>
      adjustMe;

  @override
  String? getPageID(String uniqueId, NewAppWizardParameters parameters,
          String pageType) =>
      null;
}
