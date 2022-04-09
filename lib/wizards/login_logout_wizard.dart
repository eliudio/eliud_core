import 'package:eliud_core/core/wizards/registry/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:flutter/material.dart';

import '../core_package.dart';
import 'builders/dialog/member_dashboard_dialog_builder.dart';

abstract class AccessWizard extends NewAppWizardInfoWithActionSpecification {
  AccessWizard(
      String newAppWizardName, String displayName, String wizardWidgetLabel)
      : super(newAppWizardName, displayName, wizardWidgetLabel);

  @override
  List<NewAppTask>? getCreateTasks(
    String uniqueId,
    AppModel app,
    NewAppWizardParameters parameters,
    MemberModel member,
    HomeMenuProvider homeMenuProvider,
    AppBarProvider appBarProvider,
    DrawerProvider leftDrawerProvider,
    DrawerProvider rightDrawerProvider,
  ) =>
      null;

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
}

class LoginWizard extends AccessWizard {
  LoginWizard()
      : super('signinbutton', 'Sign-in Button', 'Generate a sign-in button');

  @override
  String getPackageName() => "eliud_core";

  @override
  List<MenuItemModel>? getThoseMenuItems(String uniqueId, AppModel app) => [
        MenuItemModel(
            documentID: newRandomKey(),
            text: 'Sign in',
            description: 'Sign in',
            action: InternalAction(app,
                internalActionEnum: InternalActionEnum.Login))
      ];

  @override
  NewAppWizardParameters newAppWizardParameters() =>
      ActionSpecificationParametersBase(
        requiresAccessToLocalFileSystem: false,
        availableInLeftDrawer: false,
        availableInRightDrawer: false,
        availableInAppBar: true,
        availableInHomeMenu: false,
        available: false,
      );

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId, NewAppWizardParameters parameters, String pageType) => null;
}

class LogoutWizard extends AccessWizard {
  LogoutWizard()
      : super('signoubutton', 'Sign-out Button', 'Generate a sign-out button');

  @override
  String getPackageName() => "eliud_core";

  @override
  List<MenuItemModel>? getThoseMenuItems(String uniqueId, AppModel app) => [
        MenuItemModel(
            documentID: newRandomKey(),
            text: 'Sign out',
            description: 'Sign out',
            icon: IconModel(
                codePoint: Icons.power_settings_new.codePoint,
                fontFamily: Icons.settings.fontFamily),
            action: InternalAction(app,
                internalActionEnum: InternalActionEnum.Logout))
      ];

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
  PublicMediumModel? getPublicMediumModel(String uniqueId, NewAppWizardParameters parameters, String pageType) => null;
}

