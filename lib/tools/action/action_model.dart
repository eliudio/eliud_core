import 'dart:collection';

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/menu_def_model.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';

import '../common_tools.dart';
import 'action_entity.dart';

class ActionModelRegistry {
  final Map<String, ActionModelMapper> mappers = HashMap();
  static ActionModelRegistry _instance;

  ActionModelRegistry._internal() {
    // default mappers
    addMapper(GotoPageEntity.label, GotoPageModelMapper());
    addMapper(OpenDialogEntity.label, OpenDialogModelMapper());
    addMapper(SwitchAppEntity.label, SwitchAppModelMapper());
    addMapper(PopupMenuEntity.label, PopupMenuModelMapper());
    addMapper(InternalActionEntity.label, InternalActionModelMapper());
  }

  static ActionModelRegistry registry() {
    _instance ??= ActionModelRegistry._internal();

    return _instance;
  }

  void addMapper(String actionType, ActionModelMapper mapper) {
    mappers[actionType] = mapper;
  }

  ActionModelMapper getMapper(String actionType) {
    return mappers[actionType];
  }
}

abstract class ActionModel {
  final String appID;

  // Action only accessible conditionally. Be careful: access conditions can also be specified on the level of the page / dialog.
  // So if an action is "goto page X", then the condition of the page X applies. The lowest condition applies

  // Also important to note that data access is not limited through limiting the access on the level of the action:
  // if you want to protect your data from being accessed, then you must specify these conditions on the level of the page, dialog, component, ...
  final ReadCondition readCondition;
  final int privilegeLevelRequired;
  final String packageCondition;

  final String actionType;

  const ActionModel(this.appID, {this.readCondition, this.privilegeLevelRequired, this.packageCondition, this.actionType} );

  ActionEntity toEntity({String appId});

  static ActionModel fromEntity(ActionEntity entity) {
    if (entity == null) return null;

    var mapper = ActionModelRegistry.registry().getMapper(entity.actionType);
    if (mapper != null) {
      return mapper.fromEntity(entity);
    }

    return null;
  }

  static Future<ActionModel> fromEntityPlus(ActionEntity entity, {String appId}) async {
    if (entity == null) return null;

    var mapper = ActionModelRegistry.registry().getMapper(entity.actionType);
    if (mapper != null) {
      return mapper.fromEntityPlus(entity);
    }

    return null;
  }

  String message();

  bool hasAccess(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    if (accessState is AppLoaded) {
      accessState.actionHasAccess(this);
    }
    return true;
  }
}

abstract class ActionModelMapper {
  ActionModel fromEntity(ActionEntity entity);
  Future<ActionModel> fromEntityPlus(ActionEntity entity);
  ActionEntity fromMap(Map snap);
}

// ********************************** GotoPage **********************************

class GotoPage extends ActionModel {
  final String pageID;

  GotoPage(String appID, {ReadCondition readCondition, int privilegeLevelRequired, String packageCondition, String pageID}) : this.pageID = pageID?.toLowerCase(),
        super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType: GotoPageEntity.label);

  @override
  ActionEntity toEntity({String appId}) {
    return GotoPageEntity(
        appID,
        readCondition: readCondition == null ? null : readCondition.index,
        privilegeLevelRequired: privilegeLevelRequired,
        packageCondition: packageCondition,
        pageID: pageID
    );
  }

  static ActionModel fromEntity(GotoPageEntity entity) {
    return GotoPage(
        entity.appID,
        readCondition: toReadCondition(entity.readCondition),
        privilegeLevelRequired: entity.privilegeLevelRequired,
        packageCondition: entity.packageCondition,
        pageID: entity.pageID
    );
  }

  static Future<ActionModel> fromEntityPlus(GotoPageEntity entity) async {
    return fromEntity(entity);
  }

  @override
  String message() {
    return 'Switching page';
  }
}

class GotoPageModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => GotoPage.fromEntity(entity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => GotoPage.fromEntityPlus(entity);

  @override
  ActionEntity fromMap(Map map) => GotoPageEntity.fromMap(map);
}

// ********************************** OpenDialog **********************************

class OpenDialog extends ActionModel {
  final String dialogID;

  OpenDialog(String appID, { ReadCondition readCondition, int privilegeLevelRequired, String packageCondition, String dialogID}) : this.dialogID = dialogID?.toLowerCase(), super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType: OpenDialogEntity.label);

  @override
  ActionEntity toEntity({String appId}) {
    return OpenDialogEntity(
        appID,
        readCondition: readCondition == null ? null : readCondition.index,
        privilegeLevelRequired: privilegeLevelRequired,
        packageCondition: packageCondition,
        dialogID: dialogID
    );
  }

  static ActionModel fromEntity(OpenDialogEntity entity) {
    return OpenDialog(
        entity.appID,
        readCondition: toReadCondition(entity.readCondition),
        privilegeLevelRequired: entity.privilegeLevelRequired,
        packageCondition: entity.packageCondition,
        dialogID: entity.dialogID);
  }

  static Future<ActionModel> fromEntityPlus(OpenDialogEntity entity) async {
    return fromEntity(entity);
  }

  @override
  String message() {
    return 'Open Dialog';
  }
}

class OpenDialogModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => OpenDialog.fromEntity(entity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => OpenDialog.fromEntityPlus(entity);

  @override
  ActionEntity fromMap(Map map) => OpenDialogEntity.fromMap(map);
}

// ********************************** SwitchApp **********************************

class SwitchApp extends ActionModel {
  final String toAppID;

  SwitchApp(String appID, { ReadCondition readCondition, int privilegeLevelRequired, String packageCondition, this.toAppID}) : super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType: SwitchAppEntity.label);

  @override
  ActionEntity toEntity({String appId}) {
    return SwitchAppEntity(
        appID,
        readCondition: readCondition == null ? null : readCondition.index,
        privilegeLevelRequired: privilegeLevelRequired,
        packageCondition: packageCondition,
        toAppID: toAppID
    );
  }

  static ActionModel fromEntity(SwitchAppEntity entity) {
    return SwitchApp(
        entity.appID,
        readCondition: toReadCondition(entity.readCondition),
        privilegeLevelRequired: entity.privilegeLevelRequired,
        packageCondition: entity.packageCondition,
        toAppID: entity.toAppID);
  }

  static Future<ActionModel> fromEntityPlus(SwitchAppEntity entity) async {
    return fromEntity(entity);
  }

  static String msg = 'Switching app';

  @override
  String message() {
    return msg;
  }
}

class SwitchAppModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => SwitchApp.fromEntity(entity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => SwitchApp.fromEntityPlus(entity);

  @override
  ActionEntity fromMap(Map map) => SwitchAppEntity.fromMap(map);
}

// ********************************** PopupMenu **********************************

class PopupMenu extends ActionModel {
  final MenuDefModel menuDef;

  PopupMenu(String appID, { ReadCondition readCondition, int privilegeLevelRequired, String packageCondition, this.menuDef }) : super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType: PopupMenuEntity.label);

  @override
  ActionEntity toEntity({String appId}) {
    return PopupMenuEntity(
        appID,
        readCondition: readCondition == null ? null : readCondition.index,
        privilegeLevelRequired: privilegeLevelRequired,
        packageCondition: packageCondition,
        menuDefID: menuDef.documentID
    );
  }

  static ActionModel fromEntity(PopupMenuEntity entity) {
    return PopupMenu(
      entity.appID,
      readCondition: toReadCondition(entity.readCondition),
      privilegeLevelRequired: entity.privilegeLevelRequired,
      packageCondition: entity.packageCondition,
    );
  }

  static Future<ActionModel> fromEntityPlus(PopupMenuEntity entity) async {
    if (entity == null) return null;

    MenuDefModel menuDefModel;
    if (entity.menuDefID != null) {
      try {
        await menuDefRepository(appId: entity.appID).get(entity.menuDefID).then((val) {
          menuDefModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return PopupMenu(
        entity.appID,
        readCondition: toReadCondition(entity.readCondition),
        privilegeLevelRequired: entity.privilegeLevelRequired,
        packageCondition: entity.packageCondition,
        menuDef: menuDefModel
    );
  }

  @override
  String message() {
    return 'Open menu';
  }
}

class PopupMenuModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => PopupMenu.fromEntity(entity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => PopupMenu.fromEntityPlus(entity);

  @override
  ActionEntity fromMap(Map map) => PopupMenuEntity.fromMap(map);
}

// ********************************** InternalAction **********************************

/*
 * LoginLogout = Login when logged out, Logout when logged in.
 * OtherApps = Allows to specify that an internal action is to switch to other apps where this user has been registered before. It will translate into a specific SwitchApp action
 */
enum InternalActionEnum {
  Login, Logout, Flush, OtherApps, Unknown
}

class InternalAction extends ActionModel {
  final InternalActionEnum internalActionEnum ;

  InternalAction(String appID, { ReadCondition readCondition, int privilegeLevelRequired, String packageCondition, this.internalActionEnum }): super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType: InternalActionEntity.label);

  @override
  ActionEntity toEntity({String appId}) {
    return InternalActionEntity(
          appID,
          readCondition: readCondition == null ? null : readCondition.index,
          privilegeLevelRequired: privilegeLevelRequired,
          packageCondition: packageCondition,
          action: internalActionEnum.toString()
      );
  }

  static ActionModel fromEntity(InternalActionEntity entity) {
    var internalAction = entity.action;
    if (internalAction == InternalActionEnum.Login.toString()) return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.Login);
    if (internalAction == InternalActionEnum.Logout.toString()) return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.Logout);
    if (internalAction == InternalActionEnum.Flush.toString()) return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.Flush);
    if (internalAction == InternalActionEnum.OtherApps.toString()) return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.OtherApps);
    return
      InternalAction(
          entity.appID,
          readCondition: toReadCondition(entity.readCondition),
          privilegeLevelRequired: entity.privilegeLevelRequired,
          packageCondition: entity.packageCondition,
          internalActionEnum: InternalActionEnum.Unknown
      );
  }

  static Future<ActionModel> fromEntityPlus(InternalActionEntity entity) async {
    return fromEntity(entity);
  }

  static String unknownMsg = "What's happening?";

  @override
  String message() {
    switch (internalActionEnum) {
      case InternalActionEnum.Login: return 'Logging in';
      case InternalActionEnum.Logout: return 'Logging out';
      case InternalActionEnum.Flush: return 'Flushing cache';
      case InternalActionEnum.OtherApps: return 'Other apps';
      case InternalActionEnum.Unknown: return unknownMsg;
    }
    return unknownMsg;
  }
}

class InternalActionModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => InternalAction.fromEntity(entity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => InternalAction.fromEntityPlus(entity);

  @override
  ActionEntity fromMap(Map map) => InternalActionEntity.fromMap(map);
}

