import 'package:eliud_core_model/apis/action_api/action_model.dart';
import 'package:eliud_core_model/apis/wizard_api/action_specification_parameters_base.dart';
import 'package:eliud_core_model/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core_model/apis/wizard_api/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core_model/apis_impl/action/internal_action.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/icon_model.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/model/menu_item_model.dart';
import 'package:eliud_core_model/model/public_medium_model.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:flutter/material.dart';

abstract class AccessWizard extends NewAppWizardInfoWithActionSpecification {
  AccessWizard(
      super.newAppWizardName, super.displayName, super.wizardWidgetLabel);

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
                internalActionEnum: InternalActionEnum.login))
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
  PublicMediumModel? getPublicMediumModel(String uniqueId,
          NewAppWizardParameters parameters, String mediumType) =>
      null;
}

class LogoutWizard extends AccessWizard {
  LogoutWizard()
      : super('signoutbutton', 'Sign-out Button', 'Generate a sign-out button');

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
                internalActionEnum: InternalActionEnum.logout))
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
  PublicMediumModel? getPublicMediumModel(String uniqueId,
          NewAppWizardParameters parameters, String mediumType) =>
      null;
}
