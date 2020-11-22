import 'package:eliud_core/model/menu_def_model.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/action_entity.dart';

abstract class ActionModel {
  final String appID;
  final String actionType;

  const ActionModel(this.appID, {this.actionType});

  ActionEntity toEntity({String appId});

  static ActionModel fromEntity(ActionEntity entity) {
    if (entity == null) return null;

    if (entity.actionType == GotoPageEntity.label) return GotoPage.fromEntity(entity);
    if (entity.actionType == InternalActionEntity.label) return InternalAction.fromEntity(entity);
    if (entity.actionType == PopupMenuEntity.label) return PopupMenu.fromEntity(entity);

    return null;
  }

  static Future<ActionModel> fromEntityPlus(ActionEntity entity) async {
    if (entity is GotoPageEntity) return GotoPage.fromEntityPlus(entity);
    if (entity is InternalActionEntity) return InternalAction.fromEntityPlus(entity);
    if (entity is PopupMenuEntity) return PopupMenu.fromEntityPlus(entity);
    if (entity is SwitchAppEntity) return SwitchApp.fromEntityPlus(entity);

    return fromEntity(entity);
  }

  String message();
}

class GotoPage extends ActionModel {
  final String pageID;

  GotoPage(String appID, {String pageID}) : this.pageID = pageID?.toLowerCase(), super(appID, actionType: GotoPageEntity.label);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GotoPage &&
              appID == other.appID &&
              runtimeType == other.runtimeType &&
              pageID == other.pageID;

  @override
  String toString() {
    return 'GotoPage{pageID: $pageID }';
  }

  @override
  ActionEntity toEntity({String appId}) {
    return GotoPageEntity(
      appID,
        pageID: pageID
    );
  }

  static ActionModel fromEntity(GotoPageEntity entity) {
    return GotoPage(
      entity.appID,
        pageID: entity.pageID);
  }

  static Future<ActionModel> fromEntityPlus(GotoPageEntity entity) async {
    return fromEntity(entity);
  }

  String message() {
    return "Switching page";
  }
}

class SwitchApp extends ActionModel {
  final String toAppID;

  SwitchApp(String appID, {this.toAppID}) : super(appID, actionType: SwitchAppEntity.label);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SwitchApp &&
              runtimeType == other.runtimeType &&
              appID == other.appID &&
              toAppID == other.toAppID;

  @override
  String toString() {
    return 'SwitchApp{toAppID: $toAppID }';
  }

  @override
  ActionEntity toEntity({String appId}) {
    return SwitchAppEntity(
      appID,
      toAppID: toAppID
    );
  }

  static ActionModel fromEntity(SwitchAppEntity entity) {
    return SwitchApp(
      entity.appID,
      toAppID: entity.toAppID);
  }

  static Future<ActionModel> fromEntityPlus(SwitchAppEntity entity) async {
    return fromEntity(entity);
  }

  static String msg = "Switching app";

  String message() {
    return msg;
  }
}

class PopupMenu extends ActionModel {
  final MenuDefModel menuDef;

  PopupMenu(String appID, {this.menuDef}) : super(appID, actionType: PopupMenuEntity.label);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PopupMenu &&
              runtimeType == other.runtimeType &&
              appID == other.appID &&
              menuDef == other.menuDef;

  @override
  String toString() {
    return 'PopupMenu{menuDef: $menuDef }';
  }

  @override
  ActionEntity toEntity({String appId}) {
    return PopupMenuEntity(
      appID,
      menuDefID: menuDef.documentID
    );
  }

  static ActionModel fromEntity(PopupMenuEntity entity) {
    return PopupMenu(
      entity.appID,
    );
  }

  static Future<ActionModel> fromEntityPlus(PopupMenuEntity entity) async {
    if (entity == null) return null;

    MenuDefModel menuDefModel;
    if (entity.menuDefID != null) {
      try {
        await menuDefRepository(appID: entity.appID).get(entity.menuDefID).then((val) {
          menuDefModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return PopupMenu(
      entity.appID,
      menuDef: menuDefModel
    );
  }

  String message() {
    return "Open menu";
  }
}

/*
 * LoginLogout = Login when logged out, Logout when logged in.
 * OtherApps = Allows to specify that an internal action is to switch to other apps where this user has been registered before. It will translate into a specific SwitchApp action
 */
enum InternalActionEnum {
  Login, Logout, Flush, OtherApps, Unknown
}

class InternalAction extends ActionModel {
  final InternalActionEnum internalActionEnum ;

  InternalAction(String appID, { this.internalActionEnum }): super(appID, actionType: InternalActionEntity.label);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is InternalAction &&
              runtimeType == other.runtimeType &&
              internalActionEnum == other.internalActionEnum;

  String toString() {
    return 'InternalAction{internalActionEnum: $internalActionEnum }';
  }

  @override
  ActionEntity toEntity({String appId}) {
    return InternalActionEntity(
      appID,
        action: internalActionEnum.toString()
    );
  }

  static ActionModel fromEntity(InternalActionEntity entity) {
    String internalAction = entity.action;
    if (internalAction == InternalActionEnum.Login.toString()) return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.Login);
    if (internalAction == InternalActionEnum.Logout.toString()) return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.Logout);
    if (internalAction == InternalActionEnum.Flush.toString()) return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.Flush);
    if (internalAction == InternalActionEnum.OtherApps.toString()) return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.OtherApps);
    return InternalAction(entity.appID, internalActionEnum: InternalActionEnum.Unknown);
  }

  static Future<ActionModel> fromEntityPlus(InternalActionEntity entity) async {
    return fromEntity(entity);
  }

  static String unknownMsg = "What's happening?";

  String message() {
    switch (internalActionEnum) {
      case InternalActionEnum.Login: return "Logging in";
      case InternalActionEnum.Logout: return "Logging out";
      case InternalActionEnum.Flush: return "Flushing cache";
      case InternalActionEnum.OtherApps: return "Other apps";
      case InternalActionEnum.Unknown: return unknownMsg;
    }
    return unknownMsg;
  }
}
