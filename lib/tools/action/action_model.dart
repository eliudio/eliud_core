import 'dart:collection';

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/cupertino.dart';

import '../../core/base/model_base.dart';
import '../common_tools.dart';
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

  ActionModel(this.app, {this.conditions, this.actionType} );

  ActionEntity toEntity({String? appId, Set<ModelReference>? referencesCollector});

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

  static Future<ActionModel?> fromEntityPlus(ActionEntity? entity, {String? appId}) async {
    if (entity == null) return null;

    var mapper = ActionModelRegistry.registry()!.getMapper(entity.actionType);
    if (mapper != null) {
      var app = await appRepository()!.get(entity.appID);

      if (app != null) {
        return mapper.fromEntityPlus(app, entity);
      } else {
        var appId = entity.appID;
        throw Exception("ActionModel.fromEntityPlus App with id $appId not found");
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

  FunctionToRun(AppModel app, {DisplayConditionsModel? conditions, required this.actionToRun}) :
        super(app, conditions: conditions, actionType: 'FunctionToRun');

  @override
  String message() => 'Running Function';

  @override
  ActionEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    throw Exception('Not implemented, not expected');
  }

  @override
  String describe() => 'Run a function';
}

// ********************************** GotoPage **********************************

class GotoPage extends ActionModel {
  final String pageID;

  GotoPage(AppModel app, {DisplayConditionsModel? conditions, required String pageID}) : this.pageID = pageID.toLowerCase(),
        super(app, conditions: conditions, actionType: GotoPageEntity.label);

  @override
  ActionEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    return GotoPageEntity(
        app.documentID,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        pageID: pageID
    );
  }

  static Future<ActionModel> fromEntity(AppModel app, GotoPageEntity entity) async {
    if (entity.appID == null) throw Exception('entity GotoPage.appID is null');
    if (entity.pageID == null) throw Exception('entity GotoPage.pageID is null');

    return GotoPage(
        app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        pageID: entity.pageID!
    );
  }

  static Future<ActionModel> fromEntityPlus(AppModel app, GotoPageEntity entity) async {
    return fromEntity(app, entity);
  }

  @override
  String message() {
    return 'Switching page';
  }

  @override
  String describe() => 'Goto page ' + pageID;

  @override
  String toString() => describe();
}

class GotoPageModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) => GotoPage.fromEntity(app, entity as GotoPageEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) => GotoPage.fromEntityPlus(app, entity as GotoPageEntity);

  @override
  ActionEntity fromMap(Map map) => GotoPageEntity.fromMap(map);

}

// ********************************** OpenDialog **********************************

class OpenDialog extends ActionModel {
  final String dialogID;

  OpenDialog(AppModel app, { DisplayConditionsModel? conditions, required String dialogID}) : this.dialogID = dialogID.toLowerCase(), super(app, conditions: conditions, actionType: OpenDialogEntity.label);

  @override
  ActionEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    return OpenDialogEntity(
        appId,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        dialogID: dialogID
    );
  }

  static Future<ActionModel> fromEntity(AppModel app, OpenDialogEntity entity) async {
    if (entity.appID == null) throw Exception('entity OpenDialog.appID is null');
    if (entity.dialogID == null) throw Exception('entity OpenDialog.dialogID is null');
    return OpenDialog(
        app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        dialogID: entity.dialogID!);
  }

  static Future<ActionModel> fromEntityPlus(AppModel app, OpenDialogEntity entity) async {
    return fromEntity(app, entity);
  }

  @override
  String message() {
    return 'Open Dialog';
  }

  @override
  String describe() => 'Open dialog ' + dialogID;

  @override
  String toString() => describe();
}

class OpenDialogModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) => OpenDialog.fromEntity(app, entity as OpenDialogEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) => OpenDialog.fromEntityPlus(app, entity as OpenDialogEntity);

  @override
  ActionEntity fromMap(Map map) => OpenDialogEntity.fromMap(map);
}

// ********************************** SwitchApp **********************************

class SwitchApp extends ActionModel {
  final String toAppID;

  SwitchApp(AppModel app, { DisplayConditionsModel? conditions, required this.toAppID}) : super(app, conditions: conditions, actionType: SwitchAppEntity.label);

  @override
  ActionEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    return SwitchAppEntity(
        appId,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        toAppID: toAppID
    );
  }

  static Future<ActionModel> fromEntity(AppModel app, SwitchAppEntity entity) async {
    if (entity.appID == null) throw Exception('entity SwitchApp.appID is null');
    if (entity.toAppID == null) throw Exception('entity SwitchApp.toAppID is null');
    return SwitchApp(
        app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        toAppID: entity.toAppID!);
  }

  static Future<ActionModel> fromEntityPlus(AppModel app, SwitchAppEntity entity) async {
    return fromEntity(app, entity);
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
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) => SwitchApp.fromEntity(app, entity as SwitchAppEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) => SwitchApp.fromEntityPlus(app, entity as SwitchAppEntity);

  @override
  ActionEntity fromMap(Map map) => SwitchAppEntity.fromMap(map);
}

// ********************************** PopupMenu **********************************

class PopupMenu extends ActionModel {
  final MenuDefModel? menuDef;

  PopupMenu(AppModel app, { DisplayConditionsModel? conditions, this.menuDef }) : super(app, conditions: conditions, actionType: PopupMenuEntity.label);

  @override
  ActionEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    return PopupMenuEntity(
        appId,
        conditions: (conditions != null) ? conditions!.toEntity(): null,
        menuDefID: menuDef!.documentID
    );
  }

  static Future<ActionModel> fromEntity(AppModel app, PopupMenuEntity entity) async {
    MenuDefModel? menuDefModel;
    if (entity.menuDefID != null) {
      try {
        await menuDefRepository(appId: entity.appID)!.get(entity.menuDefID).then((val) {
          menuDefModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    if (entity.appID == null) throw Exception('entity PopupMenu.appID is null');

    return PopupMenu(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        menuDef: menuDefModel
    );
  }

  static Future<ActionModel?> fromEntityPlus(AppModel app, PopupMenuEntity entity) async {
    return fromEntity(app, entity);
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
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) => PopupMenu.fromEntity(app, entity as PopupMenuEntity);

  @override
  Future<ActionModel?> fromEntityPlus(AppModel app, ActionEntity entity) => PopupMenu.fromEntityPlus(app, entity as PopupMenuEntity);

  @override
  ActionEntity fromMap(Map map) => PopupMenuEntity.fromMap(map);
}

// ********************************** InternalAction **********************************

/*
 * LoginLogout = Login when logged out, Logout when logged in.
 * OtherApps = Allows to specify that n internal action is to switch to other apps where this user has been registered before. It will translate into a specific SwitchApp action
 */
enum InternalActionEnum {
  Login, Logout, GoHome, OtherApps, Unknown
}

class InternalAction extends ActionModel {
  final InternalActionEnum? internalActionEnum ;

  InternalAction(AppModel app, { DisplayConditionsModel? conditions, this.internalActionEnum }): super(app, conditions: conditions, actionType: InternalActionEntity.label);

  @override
  ActionEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    return InternalActionEntity(
          appId,
          conditions: (conditions != null) ? conditions!.toEntity(): null,
          action: internalActionEnum.toString()
      );
  }

  static Future<ActionModel> fromEntity(AppModel app, InternalActionEntity entity) async {
    var internalAction = entity.action;
    if (entity.appID == null) throw Exception('entity InternalAction.appID is null');
    if (internalAction == InternalActionEnum.Login.toString()) return InternalAction(app, internalActionEnum: InternalActionEnum.Login);
    if (internalAction == InternalActionEnum.Logout.toString()) return InternalAction(app, internalActionEnum: InternalActionEnum.Logout);
    if (internalAction == InternalActionEnum.GoHome.toString()) return InternalAction(app, internalActionEnum: InternalActionEnum.GoHome);
    if (internalAction == InternalActionEnum.OtherApps.toString()) return InternalAction(app, internalActionEnum: InternalActionEnum.OtherApps);
    return
      InternalAction(app,
          conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
          internalActionEnum: InternalActionEnum.Unknown
      );
  }

  static Future<ActionModel> fromEntityPlus(AppModel app, InternalActionEntity entity) async {
    return fromEntity(app, entity);
  }

  static String unknownMsg = "What's happening?";

  @override
  String message() {
    switch (internalActionEnum) {
      case InternalActionEnum.Login: return 'Logging in';
      case InternalActionEnum.Logout: return 'Logging out';
      case InternalActionEnum.GoHome: return 'Go Home';
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
      case InternalActionEnum.GoHome: return 'Go Home';
      case InternalActionEnum.OtherApps: return 'Other apps';
    }
    return '?';
  }
}

class InternalActionModelMapper implements ActionModelMapper {
  @override
  Future<ActionModel> fromEntity(AppModel app, ActionEntity entity) => InternalAction.fromEntity(app, entity as InternalActionEntity);

  @override
  Future<ActionModel> fromEntityPlus(AppModel app, ActionEntity entity) => InternalAction.fromEntityPlus(app, entity as InternalActionEntity);

  @override
  ActionEntity fromMap(Map map) => InternalActionEntity.fromMap(map);
}

