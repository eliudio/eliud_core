import 'dart:collection';

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';

import '../../core/base/model_base.dart';
import '../main_abstract_repository_singleton.dart';
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
  final AppModel app;

  // Action only accessible conditionally.
  // Be careful: the underlying page / dialog can also have StorageConditions, which also apply
  DisplayConditionsModel? conditions;
  final String? actionType;

  ActionModel(this.app, {this.conditions, this.actionType});

  ActionEntity toEntity({String? appId});

  Future<List<ModelReference>> collectReferences({String? appId});

  static Future<ActionModel?> fromEntity(ActionEntity? entity) async {
    if (entity == null) return null;

    var mapper = ActionModelRegistry.registry()!.getMapper(entity.actionType);
    if (mapper != null) {
      var app = await appRepository()!.get(entity.appID);

      if (app != null) {
        return mapper.fromEntity(app, entity);
      } else {
        var appId = entity.appID;
        throw Exception("ActionModel.fromEntity App with id $appId not found");
      }
    }

    return null;
  }

  static Future<ActionModel?> fromEntityPlus(ActionEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var mapper = ActionModelRegistry.registry()!.getMapper(entity.actionType);
    if (mapper != null) {
      var appRepo = appRepository();
      if (appRepo != null) {
        var app = await appRepo.get(entity.appID);
        if (app != null) {
          return mapper.fromEntityPlus(app, entity);
        } else {
          var appId = entity.appID;
          throw Exception(
              "ActionModel.fromEntityPlus App with id $appId not found");
        }
      }
    }

    return null;
  }

  String message();

  Future<bool> hasAccess(BuildContext context) async {
    var accessState = AccessBloc.getState(context);
    if (accessState is AccessDetermined) {
      return accessState.actionHasAccess(this);
    }
    return true;
  }

  // used for the action to describe itself. A bit like toString but as a Widget
  String describe();

  ActionModel copyWith(AppModel newApp);
}

abstract class ActionModelMapper {
  Future<ActionModel?> fromEntity(AppModel app, ActionEntity entity);
  Future<ActionModel?> fromEntityPlus(AppModel app, ActionEntity entity);
  ActionEntity? fromMap(Map snap);
}

// ********************************** FunctionToRun **********************************
// This action can only be instantiated programmatically and not stored in a repository.

class FunctionToRun extends ActionModel {
  final Function() actionToRun;

  FunctionToRun(super.app, {super.conditions, required this.actionToRun})
      : super(actionType: 'FunctionToRun');

  @override
  String message() => 'Running Function';

  @override
  ActionEntity toEntity({String? appId}) {
    throw Exception('Not implemented, not expected');
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) {
    throw Exception('Not implemented, not expected');
  }

  @override
  String describe() => 'Run a function';

  @override
  ActionModel copyWith(AppModel newApp) =>
      FunctionToRun(newApp, conditions: conditions, actionToRun: actionToRun);
}

// ********************************** GotoPage **********************************

class GotoPage extends ActionModel {
  final String pageID;

  GotoPage(super.app, {super.conditions, required String pageID})
      : pageID = pageID.toLowerCase(),
        super(actionType: GotoPageEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return GotoPageEntity(app.documentID,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        pageID: pageID);
  }

  static Future<ActionModel> fromEntity(
      AppModel app, GotoPageEntity entity) async {
    if (entity.appID == null) throw Exception('entity GotoPage.appID is null');
    if (entity.pageID == null) {
      throw Exception('entity GotoPage.pageID is null');
    }

    return GotoPage(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        pageID: entity.pageID!);
  }

  static Future<ActionModel> fromEntityPlus(
      AppModel app, GotoPageEntity entity) async {
    return fromEntity(app, entity);
  }

  @override
  String message() {
    return 'Switching page';
  }

  @override
  String describe() => 'Goto page $pageID';

  @override
  String toString() => describe();

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    return [];
  }

  @override
  ActionModel copyWith(AppModel newApp) =>
      GotoPage(newApp, conditions: conditions, pageID: pageID);
}

class GotoPageModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      GotoPage.fromEntity(app, entity as GotoPageEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) =>
      GotoPage.fromEntityPlus(app, entity as GotoPageEntity);

  @override
  ActionEntity fromMap(Map map) => GotoPageEntity.fromMap(map);
}

// ********************************** OpenDialog **********************************

class OpenDialog extends ActionModel {
  final String dialogID;

  OpenDialog(super.app, {super.conditions, required String dialogID})
      : dialogID = dialogID.toLowerCase(),
        super(actionType: OpenDialogEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return OpenDialogEntity(appId,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        dialogID: dialogID);
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    return [];
  }

  static Future<ActionModel> fromEntity(
      AppModel app, OpenDialogEntity entity) async {
    if (entity.appID == null) {
      throw Exception('entity OpenDialog.appID is null');
    }
    if (entity.dialogID == null) {
      throw Exception('entity OpenDialog.dialogID is null');
    }
    return OpenDialog(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        dialogID: entity.dialogID!);
  }

  static Future<ActionModel> fromEntityPlus(
      AppModel app, OpenDialogEntity entity) async {
    return fromEntity(app, entity);
  }

  @override
  String message() {
    return 'Open Dialog';
  }

  @override
  String describe() => 'Open dialog $dialogID';

  @override
  String toString() => describe();

  @override
  ActionModel copyWith(AppModel newApp) =>
      OpenDialog(newApp, conditions: conditions, dialogID: dialogID);
}

class OpenDialogModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      OpenDialog.fromEntity(app, entity as OpenDialogEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) =>
      OpenDialog.fromEntityPlus(app, entity as OpenDialogEntity);

  @override
  ActionEntity fromMap(Map map) => OpenDialogEntity.fromMap(map);
}

// ********************************** SwitchApp **********************************

class SwitchApp extends ActionModel {
  final String toAppID;

  SwitchApp(super.app, {super.conditions, required this.toAppID})
      : super(actionType: SwitchAppEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return SwitchAppEntity(appId,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        toAppID: toAppID);
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    return [];
  }

  static Future<ActionModel> fromEntity(
      AppModel app, SwitchAppEntity entity) async {
    if (entity.appID == null) throw Exception('entity SwitchApp.appID is null');
    if (entity.toAppID == null) {
      throw Exception('entity SwitchApp.toAppID is null');
    }
    return SwitchApp(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        toAppID: entity.toAppID!);
  }

  static Future<ActionModel> fromEntityPlus(
      AppModel app, SwitchAppEntity entity) async {
    return fromEntity(app, entity);
  }

  static String msg = 'Switching app';

  @override
  String message() {
    return msg;
  }

  @override
  String describe() => 'Switch to app $toAppID';

  @override
  ActionModel copyWith(AppModel newApp) =>
      SwitchApp(newApp, conditions: conditions, toAppID: toAppID);
}

class SwitchAppModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      SwitchApp.fromEntity(app, entity as SwitchAppEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) =>
      SwitchApp.fromEntityPlus(app, entity as SwitchAppEntity);

  @override
  ActionEntity fromMap(Map map) => SwitchAppEntity.fromMap(map);
}

// ********************************** PopupMenu **********************************

class PopupMenu extends ActionModel {
  final MenuDefModel? menuDef;

  PopupMenu(super.app, {super.conditions, this.menuDef})
      : super(actionType: PopupMenuEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return PopupMenuEntity(appId,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        menuDefID: menuDef!.documentID);
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    var referencesCollector = <ModelReference>[];
    if (menuDef != null) {
      referencesCollector.add(
          ModelReference(MenuDefModel.packageName, MenuDefModel.id, menuDef!));
    }
    return referencesCollector;
  }

  static Future<ActionModel> fromEntity(
      AppModel app, PopupMenuEntity entity) async {
    MenuDefModel? menuDefModel;
    if (entity.menuDefID != null) {
      try {
        await menuDefRepository(appId: entity.appID)!
            .get(entity.menuDefID)
            .then((val) {
          menuDefModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    if (entity.appID == null) throw Exception('entity PopupMenu.appID is null');

    return PopupMenu(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        menuDef: menuDefModel);
  }

  static Future<ActionModel?> fromEntityPlus(
      AppModel app, PopupMenuEntity entity) async {
    return fromEntity(app, entity);
  }

  @override
  String message() {
    return 'Open menu';
  }

  @override
  String describe() => 'Open popup menu';

  @override
  ActionModel copyWith(AppModel newApp) =>
      PopupMenu(newApp, conditions: conditions, menuDef: menuDef);
}

class PopupMenuModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      PopupMenu.fromEntity(app, entity as PopupMenuEntity);

  @override
  Future<ActionModel?> fromEntityPlus(AppModel app, ActionEntity entity) =>
      PopupMenu.fromEntityPlus(app, entity as PopupMenuEntity);

  @override
  ActionEntity fromMap(Map map) => PopupMenuEntity.fromMap(map);
}

// ********************************** InternalAction **********************************

/*
 * LoginLogout = Login when logged out, Logout when logged in.
 * OtherApps = Allows to specify that n internal action is to switch to other apps where this user has been registered before. It will translate into a specific SwitchApp action
 */
enum InternalActionEnum { login, logout, goHome, otherApps, unknown }

class InternalAction extends ActionModel {
  final InternalActionEnum? internalActionEnum;

  InternalAction(super.app, {super.conditions, this.internalActionEnum})
      : super(actionType: InternalActionEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return InternalActionEntity(appId,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        action: internalActionEnum.toString());
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    return [];
  }

  static Future<ActionModel> fromEntity(
      AppModel app, InternalActionEntity entity) async {
    var internalAction = entity.action;
    if (entity.appID == null) {
      throw Exception('entity InternalAction.appID is null');
    }
    if (internalAction != null) {
      if (internalAction.toLowerCase() ==
          InternalActionEnum.login.toString().toLowerCase()) {
        return InternalAction(app,
            internalActionEnum: InternalActionEnum.login);
      }
      if (internalAction.toLowerCase() ==
          InternalActionEnum.logout.toString().toLowerCase()) {
        return InternalAction(app,
            internalActionEnum: InternalActionEnum.logout);
      }
      if (internalAction.toLowerCase() ==
          InternalActionEnum.goHome.toString().toLowerCase()) {
        return InternalAction(app,
            internalActionEnum: InternalActionEnum.goHome);
      }
      if (internalAction.toLowerCase() ==
          InternalActionEnum.otherApps.toString().toLowerCase()) {
        return InternalAction(app,
            internalActionEnum: InternalActionEnum.otherApps);
      }
    }
    return InternalAction(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        internalActionEnum: InternalActionEnum.unknown);
  }

  static Future<ActionModel> fromEntityPlus(
      AppModel app, InternalActionEntity entity) async {
    return fromEntity(app, entity);
  }

  static String unknownMsg = "What's happening?";

  @override
  String message() {
    switch (internalActionEnum) {
      case InternalActionEnum.login:
        return 'Logging in';
      case InternalActionEnum.logout:
        return 'Logging out';
      case InternalActionEnum.goHome:
        return 'Go Home';
      case InternalActionEnum.otherApps:
        return 'Other apps';
      case InternalActionEnum.unknown:
        return unknownMsg;
      case null:
        break;
    }
    return unknownMsg;
  }

  @override
  String describe() {
    switch (internalActionEnum) {
      case InternalActionEnum.login:
        return 'Login';
      case InternalActionEnum.logout:
        return 'Logout';
      case InternalActionEnum.goHome:
        return 'Go Home';
      case InternalActionEnum.otherApps:
        return 'Other apps';
      case InternalActionEnum.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  @override
  ActionModel copyWith(AppModel newApp) => InternalAction(newApp,
      conditions: conditions, internalActionEnum: internalActionEnum);
}

class InternalActionModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) =>
      InternalAction.fromEntity(app, entity as InternalActionEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) =>
      InternalAction.fromEntityPlus(app, entity as InternalActionEntity);

  @override
  ActionEntity fromMap(Map map) => InternalActionEntity.fromMap(map);
}
