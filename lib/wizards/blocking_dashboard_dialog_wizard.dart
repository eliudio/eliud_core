import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/wizard_api/action_specification_parameters_base.dart';
import 'package:eliud_core_model/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core_model/apis/wizard_api/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core_model/apis_impl/action/open_dialog.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/display_conditions_model.dart';
import 'package:eliud_core_model/model/icon_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/model/menu_item_model.dart';
import 'package:eliud_core_model/model/public_medium_model.dart';
import 'package:eliud_core_model/wizards/tools/document_identifier.dart';
import 'package:flutter/material.dart';

import '../core_package.dart';
import 'builders/dialog/blocking_dashboard_dialog_builder.dart';

class BlockingDashboardDialogWizard
    extends NewAppWizardInfoWithActionSpecification {
  static String blockingDashboardDialogId = 'blocking_dashboard';

  BlockingDashboardDialogWizard()
      : super('blockingdashboard', 'Blocked members',
            'Generate a default Blocked members Dialog');

  @override
  NewAppWizardParameters newAppWizardParameters() =>
      ActionSpecificationParametersBase(
        requiresAccessToLocalFileSystem: false,
        availableInLeftDrawer: false,
        availableInRightDrawer: true,
        availableInAppBar: false,
        availableInHomeMenu: false,
        available: false,
      );

  @override
  String getPackageName() => 'eliud_core';

  @override
  List<MenuItemModel>? getThoseMenuItems(String uniqueId, AppModel app) => [
        menuItemManageAccount(uniqueId, app, blockingDashboardDialogId),
      ];

  MenuItemModel menuItemManageAccount(
          String uniqueId, AppModel app, dialogID) =>
      MenuItemModel(
          documentID: dialogID,
          text: 'Blocked members',
          description: 'Blocked members',
          icon: IconModel(
              codePoint: Icons.account_box.codePoint,
              fontFamily: Icons.settings.fontFamily),
          action: OpenDialog(app,
              dialogID:
                  constructDocumentId(uniqueId: uniqueId, documentId: dialogID),
              conditions: DisplayConditionsModel(
                  privilegeLevelRequired:
                      PrivilegeLevelRequired.noPrivilegeRequired,
                  packageCondition: CorePackage.mustBeLoggedIn)));

  @override
  AppModel updateApp(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel adjustMe,
  ) =>
      adjustMe;

  @override
  ActionModel? getAction(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel app,
    String actionType,
  ) =>
      null;

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId,
          NewAppWizardParameters parameters, String mediumType) =>
      null;

  @override
  List<NewAppTask>? getCreateTasks(
      String uniqueId,
      AppModel app,
      NewAppWizardParameters parameters,
      MemberModel member,
      HomeMenuProvider homeMenuProvider,
      AppBarProvider appBarProvider,
      DrawerProvider leftDrawerProvider,
      DrawerProvider rightDrawerProvider) {
    if (parameters is ActionSpecificationParametersBase) {
      var blockingDashboardDialogSpecifications =
          parameters.actionSpecifications;

      if (blockingDashboardDialogSpecifications
          .shouldCreatePageDialogOrWorkflow()) {
        var tasks = <NewAppTask>[];
        tasks.add(() async {
          await BlockingDashboardDialogBuilder(
                  uniqueId, app, blockingDashboardDialogId)
              .create();
        });
        return tasks;
      }
    } else {
      throw Exception('Unexpected class for parameters: $parameters');
    }
    return null;
  }
}
