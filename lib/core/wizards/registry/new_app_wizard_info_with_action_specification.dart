import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/widgets/action_specification_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

abstract class NewAppWizardInfoWithActionSpecification extends NewAppWizardInfo {
  final String wizardWidgetLabel;

  NewAppWizardInfoWithActionSpecification(String newAppWizardName, String displayName, this.wizardWidgetLabel) : super(newAppWizardName, displayName);

  @override
  List<MenuItemModel>? getMenuItemsFor(AppModel app, NewAppWizardParameters parameters, MenuType type) {
    if (parameters is ActionSpecificationParametersBase) {
      var feedSpecifications = parameters.actionSpecifications;
      var generate = (type == MenuType.leftDrawerMenu) && feedSpecifications.availableInLeftDrawer ||
          (type == MenuType.rightDrawerMenu) && feedSpecifications.availableInRightDrawer ||
          (type == MenuType.bottomNavBarMenu) && feedSpecifications.availableInHomeMenu ||
          (type == MenuType.appBarMenu) && feedSpecifications.availableInAppBar;
      if (generate) {
        return getThoseMenuItems(app);
      }
    } else {
      throw Exception('Unexpected class for parameters: ' + parameters.toString());
    }
    return null;
  }

  List<MenuItemModel>? getThoseMenuItems(AppModel app);

  @override
  Widget wizardParametersWidget(AppModel app, BuildContext context, NewAppWizardParameters parameters) {
    if (parameters is ActionSpecificationParametersBase) {
      return ActionSpecificationWidget(
          app: app,
          enabled: true,
          actionSpecification: parameters.actionSpecifications,
          label: wizardWidgetLabel);
    } else {
      return text(app, context, 'Unexpected class for parameters: ' + parameters.toString());
    }
  }

  @override
  AppModel updateApp(NewAppWizardParameters parameters, AppModel adjustMe, ) => adjustMe;

  @override
  String? getPageID(String pageType) => null;
}
