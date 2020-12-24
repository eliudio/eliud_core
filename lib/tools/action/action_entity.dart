import 'package:eliud_core/tools/action/action_model.dart';
import 'package:equatable/equatable.dart';

abstract class ActionEntity {
  final String appID;
  final String actionType;

  const ActionEntity(this.appID, { this.actionType });

  Map<String, Object> toDocument();

  static ActionEntity fromMap(Map snap) => ActionModelRegistry.registry().getMapper(snap["actionType"]).fromMap(snap);
}

class GotoPageEntity extends ActionEntity {
  static const String label = "GotoPage";
  final String pageID;

  const GotoPageEntity(String appID, { this.pageID }) : super(appID, actionType : label);

  Map<String, Object> toDocument() {
    return {
      "appID": appID,
      "actionType": actionType,
      "pageID": pageID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return GotoPageEntity(
        snap["appID"],
        pageID: snap["pageID"]
    );
  }
}

class OpenDialogEntity extends ActionEntity {
  static const String label = "Dialog";
  final String dialogID;

  const OpenDialogEntity(String appID, { this.dialogID }) : super(appID, actionType : label);

  Map<String, Object> toDocument() {
    return {
      "appID": appID,
      "actionType": actionType,
      "dialogID": dialogID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return OpenDialogEntity(snap["appID"],
        dialogID: snap["dialogID"]
    );
  }
}

class SwitchAppEntity extends ActionEntity {
  static const String label = "SwitchApp";
  final String toAppID;

  const SwitchAppEntity(String appID, { this.toAppID }) : super(appID, actionType : label);

  Map<String, Object> toDocument() {
    return {
      "appID": appID,
      "actionType": actionType,
      "toAppID": toAppID,
    };
  }

  static ActionEntity fromMap(Map snap) {
    return SwitchAppEntity(
        snap["appID"],
        toAppID: snap["toAppID"]
    );
  }
}

class PopupMenuEntity extends ActionEntity {
  static const String label = "PopupMenu";
  final String menuDefID;

  const PopupMenuEntity(String appID, { this.menuDefID }) : super(appID, actionType : label);

  Map<String, Object> toDocument() {
    return {
      "actionType": actionType,
      "appID": appID,
      "menuDefID": menuDefID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return PopupMenuEntity(
      snap["appID"],
      menuDefID: snap["menuDefID"]
    );
  }
}

class InternalActionEntity extends ActionEntity {
  static const String label = "InternalAction";
  final String action;

  const InternalActionEntity(String appID, { this.action }) : super(appID, actionType: label);

  Map<String, Object> toDocument() {
    return {
      "actionType": actionType,
      "appID": appID,
      "action": action
    };
  }

  static ActionEntity fromJson(Map<String, Object> json) {
    return InternalActionEntity(
      json["appID"] as String,
      action: json["action"] as String,
    );
  }

  static ActionEntity fromMap(Map snap) {
    return InternalActionEntity(
      snap["appID"],
      action: snap["action"]
    );
  }
}

