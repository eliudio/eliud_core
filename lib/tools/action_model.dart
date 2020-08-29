import 'package:eliud_core/model/menu_def_model.dart';

import '../model/abstract_repository_singleton.dart';
import '../tools/action_entity.dart';

abstract class ActionModel {
  final String actionType;

  const ActionModel({this.actionType});

  ActionEntity toEntity();

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

  GotoPage({String pageID}) : this.pageID = pageID?.toLowerCase(), super(actionType: "GotoPage");

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GotoPage &&
              runtimeType == other.runtimeType &&
              pageID == other.pageID;

  @override
  String toString() {
    return 'GotoPage{pageID: $pageID }';
  }

  @override
  ActionEntity toEntity() {
    return GotoPageEntity(
        pageID: pageID
    );
  }

  static ActionModel fromEntity(GotoPageEntity entity) {
    return GotoPage(
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
  final String appID;

  SwitchApp({this.appID}) : super(actionType: "SwitchApp");

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SwitchApp &&
              runtimeType == other.runtimeType &&
              appID == other.appID;

  @override
  String toString() {
    return 'SwitchApp{appID: $appID }';
  }

  @override
  ActionEntity toEntity() {
    return SwitchAppEntity(
        appID: appID
    );
  }

  static ActionModel fromEntity(SwitchAppEntity entity) {
    return SwitchApp(
        appID: entity.appID);
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

    PopupMenu({this.menuDef}) : super(actionType: "PopupMenu") {
    if (menuDef == null) {
      print("ooo");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PopupMenu &&
              runtimeType == other.runtimeType &&
              menuDef == other.menuDef;

  @override
  String toString() {
    return 'PopupMenu{menuDef: $menuDef }';
  }

  @override
  ActionEntity toEntity() {
    return PopupMenuEntity(
        menuDefID: menuDef.documentID
    );
  }

  static ActionModel fromEntity(PopupMenuEntity entity) {
    return PopupMenu();
  }

  static Future<ActionModel> fromEntityPlus(PopupMenuEntity entity) async {
    if (entity == null) return null;

    MenuDefModel menuDefModel;
    if (entity.menuDefID != null) {
      try {
        await AbstractRepositorySingleton.singleton.menuDefRepository().get(entity.menuDefID).then((val) {
          menuDefModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return PopupMenu(
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

  InternalAction({ this.internalActionEnum });

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
  ActionEntity toEntity() {
    return InternalActionEntity(
        action: internalActionEnum.toString()
    );
  }

  static ActionModel fromEntity(InternalActionEntity entity) {
    String internalAction = entity.action;
    if (internalAction == InternalActionEnum.Login.toString()) return InternalAction(internalActionEnum: InternalActionEnum.Login);
    if (internalAction == InternalActionEnum.Logout.toString()) return InternalAction(internalActionEnum: InternalActionEnum.Logout);
    if (internalAction == InternalActionEnum.Flush.toString()) return InternalAction(internalActionEnum: InternalActionEnum.Flush);
    if (internalAction == InternalActionEnum.OtherApps.toString()) return InternalAction(internalActionEnum: InternalActionEnum.OtherApps);
    return InternalAction(internalActionEnum: InternalActionEnum.Unknown);
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
