import 'dart:collection';

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/conditions_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/cupertino.dart';

import '../common_tools.dart';
import 'action_entity.dart';

class ActionModelRegistry {
  final Map<String, ActionModelMapper> mappers = HashMap();
  static ActionModelRegistry? _instance;

  ActionModelRegistry._internal() {
    // default mappers
    addMapper(GotoPageEntity.label, GotoPageModelMapper());
    addMapper(OpenDialogEntity.label, OpenDialogModelMapper());
    addMapper(SwitchAppEntity.label, SwitchAppModelMapper());
    addMapper(PopupMenuEntity.label, PopupMenuModelMapper());
    addMapper(InternalActionEntity.label, InternalActionModelMapper());
  }

  static ActionModelRegistry? registry() {
    _instance ??= ActionModelRegistry._internal();

    return _instance;
  }

  void addMapper(String actionType, ActionModelMapper mapper) {
    mappers[actionType] = mapper;
  }

  ActionModelMapper? getMapper(String? actionType) {
    return mappers[actionType!];
  }
}

abstract class ActionModel {
  final String appID;

  // Action only accessible conditionally. Be careful: access conditions can also be specified on the level of the page / dialog.
  // So if an action is "goto page X", then the condition of the page X applies. The lowest condition applies

  // Also important to note that data access is not limited through limiting the access on the level of the action:
  // if you want to protect your data from being accessed, then you must specify these conditions on the level of the page, dialog, component, ...
  final ConditionsModel? conditions;
  final String? actionType;

  const ActionModel(this.appID, {this.conditions, this.actionType} );

  ActionEntity toEntity({String? appId});

  static ActionModel? fromEntity(ActionEntity? entity) {
    if (entity == null) return null;

    var mapper = ActionModelRegistry.registry()!.getMapper(entity.actionType);
    if (mapper != null) {
      return mapper.fromEntity(entity);
    }

    return null;
  }

  static Future<ActionModel?> fromEntityPlus(ActionEntity? entity, {String? appId}) async {
    if (entity == null) return null;

    var mapper = ActionModelRegistry.registry()!.getMapper(entity.actionType);
    if (mapper != null) {
      return mapper.fromEntityPlus(entity);
    }

    return null;
  }

  String message();

  bool hasAccess(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    if (accessState is AppLoaded) {
      return accessState.actionHasAccess(this);
    }
    return true;
  }

  // used for the action to describe itself. A bit like toString but as a Widget
  String describe();
}

abstract class ActionModelMapper {
  ActionModel? fromEntity(ActionEntity entity);
  Future<ActionModel?> fromEntityPlus(ActionEntity entity);
  ActionEntity? fromMap(Map snap);
}


// ********************************** FunctionToRun **********************************
// This action can only be instantiated programmatically and not stored in a repository.

class FunctionToRun extends ActionModel {
  final Function() actionToRun;

  FunctionToRun(String appID, {ConditionsModel? conditions, required this.actionToRun}) :
        super(appID, conditions: conditions, actionType: 'FunctionToRun');

  @override
  String message() => 'Running Function';

  @override
  ActionEntity toEntity({String? appId}) {
    throw Exception('Not implemented, not expected');
  }

  @override
  String describe() => 'Run a function';
}

// ********************************** GotoPage **********************************

class GotoPage extends ActionModel {
  final String pageID;

  GotoPage(String appID, {ConditionsModel? conditions, required String pageID}) : this.pageID = pageID.toLowerCase(),
        super(appID, conditions: conditions, actionType: GotoPageEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return GotoPageEntity(
        appID,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        pageID: pageID
    );
  }

  static ActionModel fromEntity(GotoPageEntity entity) {
    if (entity.appID == null) throw Exception('entity GotoPage.appID is null');
    if (entity.pageID == null) throw Exception('entity GotoPage.pageID is null');
    return GotoPage(
        entity.appID!,
        conditions: ConditionsModel.fromEntity(entity.conditions),
        pageID: entity.pageID!
    );
  }

  static Future<ActionModel> fromEntityPlus(GotoPageEntity entity) async {
    return fromEntity(entity);
  }

  @override
  String message() {
    return 'Switching page';
  }

  @override
  String describe() => 'Goto page ' + pageID;
}

class GotoPageModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => GotoPage.fromEntity(entity as GotoPageEntity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => GotoPage.fromEntityPlus(entity as GotoPageEntity);

  @override
  ActionEntity fromMap(Map map) => GotoPageEntity.fromMap(map);
}

// ********************************** OpenDialog **********************************

class OpenDialog extends ActionModel {
  final String dialogID;

  OpenDialog(String appID, { ConditionsModel? conditions, required String dialogID}) : this.dialogID = dialogID.toLowerCase(), super(appID, conditions: conditions, actionType: OpenDialogEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return OpenDialogEntity(
        appID,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        dialogID: dialogID
    );
  }

  static ActionModel fromEntity(OpenDialogEntity entity) {
    if (entity.appID == null) throw Exception('entity OpenDialog.appID is null');
    if (entity.dialogID == null) throw Exception('entity OpenDialog.dialogID is null');
    return OpenDialog(
        entity.appID!,
        conditions: ConditionsModel.fromEntity(entity.conditions),
        dialogID: entity.dialogID!);
  }

  static Future<ActionModel> fromEntityPlus(OpenDialogEntity entity) async {
    return fromEntity(entity);
  }

  @override
  String message() {
    return 'Open Dialog';
  }

  @override
  String describe() => 'Open dialog ' + dialogID;
}

class OpenDialogModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => OpenDialog.fromEntity(entity as OpenDialogEntity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => OpenDialog.fromEntityPlus(entity as OpenDialogEntity);

  @override
  ActionEntity fromMap(Map map) => OpenDialogEntity.fromMap(map);
}

// ********************************** SwitchApp **********************************

class SwitchApp extends ActionModel {
  final String toAppID;

  SwitchApp(String appID, { ConditionsModel? conditions, required this.toAppID}) : super(appID, conditions: conditions, actionType: SwitchAppEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return SwitchAppEntity(
        appID,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        toAppID: toAppID
    );
  }

  static ActionModel fromEntity(SwitchAppEntity entity) {
    if (entity.appID == null) throw Exception('entity SwitchApp.appID is null');
    if (entity.toAppID == null) throw Exception('entity SwitchApp.toAppID is null');
    return SwitchApp(
        entity.appID!,
        conditions: ConditionsModel.fromEntity(entity.conditions),
        toAppID: entity.toAppID!);
  }

  static Future<ActionModel> fromEntityPlus(SwitchAppEntity entity) async {
    return fromEntity(entity);
  }

  static String msg = 'Switching app';

  @override
  String message() {
    return msg;
  }

  @override
  String describe() => 'Switch to app ' + toAppID;
}

class SwitchAppModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => SwitchApp.fromEntity(entity as SwitchAppEntity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => SwitchApp.fromEntityPlus(entity as SwitchAppEntity);

  @override
  ActionEntity fromMap(Map map) => SwitchAppEntity.fromMap(map);
}

// ********************************** PopupMenu **********************************

class PopupMenu extends ActionModel {
  final MenuDefModel? menuDef;

  PopupMenu(String appID, { ConditionsModel? conditions, this.menuDef }) : super(appID, conditions: conditions, actionType: PopupMenuEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return PopupMenuEntity(
        appID,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        menuDefID: menuDef!.documentID
    );
  }

  static ActionModel fromEntity(PopupMenuEntity entity) {
    if (entity.appID == null) throw Exception('entity PopupMenu.appID is null');
    return PopupMenu(
      entity.appID!,
      conditions: ConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<ActionModel?> fromEntityPlus(PopupMenuEntity entity) async {
    MenuDefModel? menuDefModel;
    if (entity.menuDefID != null) {
      try {
        await menuDefRepository(appId: entity.appID)!.get(entity.menuDefID).then((val) {
          menuDefModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    if (entity.appID == null) throw Exception('entity PopupMenu.appID is null');

    return PopupMenu(
        entity.appID!,
        conditions: ConditionsModel.fromEntity(entity.conditions),
        menuDef: menuDefModel
    );
  }

  @override
  String message() {
    return 'Open menu';
  }

  @override
  String describe() => 'Open popup menu';
}

class PopupMenuModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => PopupMenu.fromEntity(entity as PopupMenuEntity);

  @override
  Future<ActionModel?> fromEntityPlus(ActionEntity entity) => PopupMenu.fromEntityPlus(entity as PopupMenuEntity);

  @override
  ActionEntity fromMap(Map map) => PopupMenuEntity.fromMap(map);
}

// ********************************** InternalAction **********************************

/*
 * LoginLogout = Login when logged out, Logout when logged in.
 * OtherApps = Allows to specify that n internal action is to switch to other apps where this user has been registered before. It will translate into a specific SwitchApp action
 */
enum InternalActionEnum {
  Login, Logout, Flush, OtherApps, Unknown
}

class InternalAction extends ActionModel {
  final InternalActionEnum? internalActionEnum ;

  InternalAction(String appID, { ConditionsModel? conditions, this.internalActionEnum }): super(appID, conditions: conditions, actionType: InternalActionEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return InternalActionEntity(
          appID,
          conditions: (conditions != null) ? conditions!.toEntity(): null,
          action: internalActionEnum.toString()
      );
  }

  static ActionModel fromEntity(InternalActionEntity entity) {
    var internalAction = entity.action;
    if (entity.appID == null) throw Exception('entity InternalAction.appID is null');
    if (internalAction == InternalActionEnum.Login.toString()) return InternalAction(entity.appID!, internalActionEnum: InternalActionEnum.Login);
    if (internalAction == InternalActionEnum.Logout.toString()) return InternalAction(entity.appID!, internalActionEnum: InternalActionEnum.Logout);
    if (internalAction == InternalActionEnum.Flush.toString()) return InternalAction(entity.appID!, internalActionEnum: InternalActionEnum.Flush);
    if (internalAction == InternalActionEnum.OtherApps.toString()) return InternalAction(entity.appID!, internalActionEnum: InternalActionEnum.OtherApps);
    return
      InternalAction(
          entity.appID!,
          conditions: ConditionsModel.fromEntity(entity.conditions),
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

  @override
  String describe() {
    switch (internalActionEnum) {
      case InternalActionEnum.Login: return 'Login';
      case InternalActionEnum.Logout: return 'Logout';
      case InternalActionEnum.Flush: return 'Flushing cache';
      case InternalActionEnum.OtherApps: return 'Other apps';
    }
    return '?';
  }
}

class InternalActionModelMapper implements ActionModelMapper {
  @override
  ActionModel fromEntity(ActionEntity entity) => InternalAction.fromEntity(entity as InternalActionEntity);

  @override
  Future<ActionModel> fromEntityPlus(ActionEntity entity) => InternalAction.fromEntityPlus(entity as InternalActionEntity);

  @override
  ActionEntity fromMap(Map map) => InternalActionEntity.fromMap(map);
}

